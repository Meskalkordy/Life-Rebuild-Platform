

let currentStep = 1;
let uploadedImagesBase64 = [];
let uploadedDocsBase64 = [];   

function changeStep(stepDirection) {
    const steps = document.querySelectorAll(".form-step");
    if (steps.length === 0) return;

    steps[currentStep - 1].classList.remove("active");
    currentStep += stepDirection;
    
    if (currentStep < 1) currentStep = 1;
    if (currentStep > steps.length) currentStep = steps.length;

    steps[currentStep - 1].classList.add("active");
    updateStepper(currentStep);

    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");

    if (prevBtn) {
        prevBtn.style.visibility = (currentStep === 1) ? "hidden" : "visible";
    }

    if (nextBtn) {
        if (currentStep === 4) {
            nextBtn.innerHTML = 'إرسال التوثيق <i class="fas fa-check"></i>';
            nextBtn.style.backgroundColor = "#22c55e";
            
            nextBtn.onclick = function(e) {
                if(e) e.preventDefault(); 
                saveAllFormData(); 
            };
        } else {
            nextBtn.innerHTML = 'التالي <i class="fas fa-arrow-left"></i>';
            nextBtn.style.backgroundColor = "#3b82f6";
            nextBtn.onclick = function() { changeStep(1); };
        }
    }
}


function saveAllFormData() {
    const fullName = document.getElementById("form-fullname")?.value.trim() || "مواطن كريم";
    const email = document.getElementById("form-email")?.value.trim() || "info@example.com";
    const phone = document.getElementById("form-phone")?.value.trim() || "+970 59 000 0000";
    const familySize = document.getElementById("form-familysize")?.value.trim() || "1";
    const description = document.getElementById("form-description")?.value.trim() || "لا يوجد وصف تفصيلي.";
    const amount = document.getElementById("form-amount")?.value.trim() || "0";
    
    const city = document.getElementById("city-input")?.value.trim() || "غير محدد";
    const street = document.getElementById("street-address")?.value.trim() || "غير محدد";
    const district = document.getElementById("district-input")?.value.trim() || "غير محدد";
    const building = document.getElementById("building-input")?.value.trim() || "";
    
    const lat = document.getElementById("lat-input")?.value || "31.5000";
    const lng = document.getElementById("lng-input")?.value || "34.5000";

    let selectedLossTypes = [];
    document.querySelectorAll(".selection-card.active").forEach(card => {
        const text = card.querySelector(".selection-text")?.innerText;
        if(text) selectedLossTypes.push(text);
    });
    const lossTypeResult = selectedLossTypes.length > 0 ? selectedLossTypes.join(", ") : "عقار سكني";

    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    const currentSubmissionDate = new Date().toLocaleDateString('ar-EG', options);
    
    const now = new Date();
    let hours = now.getHours();
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const ampm = hours >= 12 ? 'مساءً' : 'صباحاً';
    hours = hours % 12 || 12;
    const currentSubmissionTime = `الساعة ${hours}:${minutes} ${ampm}`;

    const documentLossData = {
        fullName,
        email,
        phone,
        familySize,
        description,
        amount,
        fullAddress: `${street}، حي ${district}، ${city} ${building ? ' - ' + building : ''}`,
        lat,
        lng,
        lossType: lossTypeResult,
        images: uploadedImagesBase64,
        documents: uploadedDocsBase64,
        submissionDate: currentSubmissionDate, 
        submissionTime: currentSubmissionTime
    };

    localStorage.setItem("latestLossRequest", JSON.stringify(documentLossData));
    localStorage.setItem("currentUserName", fullName);

    alert("تم حفظ وتوثيق بيانات خسارتك بنجاح! سيتم توجيهك الآن.");
    window.location.href = "../html pages/verification_details.html"; 
}

function updateStepper(step) {
    const stepperItems = document.querySelectorAll(".step");
    stepperItems.forEach((item, index) => {
        const stepNum = index + 1;
        if (stepNum < step) {
            item.classList.add("completed");
            item.classList.remove("active");
            const numEl = item.querySelector(".step-number");
            if (numEl) numEl.innerHTML = '<i class="fas fa-check"></i>';
        } else if (stepNum === step) {
            item.classList.add("active");
            item.classList.remove("completed");
            const numEl = item.querySelector(".step-number");
            if (numEl) numEl.innerText = stepNum;
        } else {
            item.classList.remove("active", "completed");
            const numEl = item.querySelector(".step-number");
            if (numEl) numEl.innerText = stepNum;
        }
    });
}


function getRealLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition((position) => {
            const latField = document.getElementById('lat-input');
            const lngField = document.getElementById('lng-input');
            if (latField) latField.value = position.coords.latitude.toFixed(6);
            if (lngField) lngField.value = position.coords.longitude.toFixed(6);
            
            const btn = document.querySelector('.btn-location');
            if(btn) {
                btn.innerHTML = '<i class="fas fa-check"></i> تم تحديد الموقع';
                btn.style.backgroundColor = "#22c55e";
            }
        }, (error) => {
            alert("يرجى تفعيل صلاحية الوصول للموقع في متصفحك.");
        });
    } else {
        alert("تحديد الموقع غير مدعوم في متصفحك.");
    }
}

function selectCard(card) {
    if (card) {
        card.classList.toggle('active');
    }
}


function toggleChat() {
    const chatPopup = document.getElementById("chatPopup");
    if (chatPopup) {
        chatPopup.style.display = (chatPopup.style.display === "flex") ? "none" : "flex";
    }
}

let selectedDoctorName = "";

function openBookingModal(doctorName) {
    selectedDoctorName = doctorName || "الأخصائي النفسي"; 
    const modal = document.getElementById('bookingModal');
    if (modal) modal.style.display = 'flex';
}

function closeBookingModal() {
    const modal = document.getElementById('bookingModal');
    if (modal) modal.style.display = 'none';
}

function confirmBooking() {
    const methodSelect = document.getElementById('communicationMethod');
    if (!methodSelect) return;

    const methodValue = methodSelect.value;
    const currentTimeStr = new Date().toLocaleTimeString('ar-EG', { 
        hour: '2-digit', 
        minute: '2-digit', 
        hour12: true 
    }).replace("ص", "صباحاً").replace("م", "مساءً");

    const todayStr = new Date().toLocaleDateString('ar-EG', { year: 'numeric', month: 'long', day: 'numeric' });

    const appointmentData = {
        id: Date.now(),
        doctor: selectedDoctorName,
        date: todayStr,
        time: currentTimeStr, 
        value: methodValue
    };

    let savedAppointments = JSON.parse(localStorage.getItem('myAppointments')) || [];
    savedAppointments.push(appointmentData);
    localStorage.setItem('myAppointments', JSON.stringify(savedAppointments));

    renderAppointments();
    alert(`تم تأكيد حجزك بنجاح مع ${selectedDoctorName} وتم حفظ الموعد في النظام!`);
    closeBookingModal();
}

function renderAppointments() {
    const dynamicContainer = document.getElementById('dynamicAppointments');
    if (!dynamicContainer) return;

    dynamicContainer.innerHTML = "";
    const savedAppointments = JSON.parse(localStorage.getItem('myAppointments')) || [];

    savedAppointments.forEach(apt => {
        const newApt = document.createElement('div');
        newApt.className = 'apt-item green-border';
        
        let iconClass = 'fas fa-phone-alt phone-icon'; 
        if (apt.value === 'video') {
            iconClass = 'fas fa-video video-icon';
        }

        newApt.innerHTML = `
            <div class="apt-content-top">
                <div class="text-group">
                    <strong>${apt.doctor}</strong>
                    <span class="date-text">${apt.date}</span>
                    <span class="time-green" style="color: #22c55e; font-weight: bold;">${apt.time}</span>
                </div>
                <i class="${iconClass}" aria-hidden="true"></i>
            </div>
            <div class="apt-actions">
                <button class="btn-cancel" onclick="deleteAppointment(${apt.id})">إلغاء</button>
            </div>
        `;
        dynamicContainer.appendChild(newApt);
    });
}

function deleteAppointment(id) {
    let savedAppointments = JSON.parse(localStorage.getItem('myAppointments')) || [];
    savedAppointments = savedAppointments.filter(apt => apt.id !== id);
    localStorage.setItem('myAppointments', JSON.stringify(savedAppointments));
    renderAppointments();
}

document.addEventListener("DOMContentLoaded", function () {
    
    const splash = document.getElementById("splash-screen");
    if (splash) {
        setTimeout(() => {
            splash.classList.add("fade-out");
        }, 3000); 
    }

    renderAppointments();

    const days = document.querySelectorAll('.day:not(.empty)');
    if (days.length > 0) {
        days.forEach(day => {
            day.addEventListener('click', function() {
                days.forEach(d => d.classList.remove('active'));
                this.classList.add('active');
            });
        });
    }

    const fileInput = document.getElementById("actual-file-input");
    if (fileInput) {
        fileInput.addEventListener('change', function() {
            if (this.files.length > 0) {
                alert(`تم رفع (${this.files.length}) ملفات إضافية وجاري معالجتها وتجهيز المعاينة.`);
                
                let previewContainer = document.getElementById('imagesPreviewContainer');
                if (!previewContainer) {
                    previewContainer = document.createElement('div');
                    previewContainer.id = 'imagesPreviewContainer';
                    previewContainer.style = 'display:flex; gap:10px; flex-wrap:wrap; margin-top:15px;';
                    fileInput.parentNode.appendChild(previewContainer);
                }

                Array.from(this.files).forEach(file => {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        if (file.type.startsWith('image/')) {
                            uploadedImagesBase64.push({
                                name: file.name,
                                data: e.target.result
                            });

                            const img = document.createElement('img');
                            img.src = e.target.result;
                            img.style = 'width:80px; height:80px; object-fit:cover; border-radius:8px; border:2px solid #22c55e;';
                            previewContainer.appendChild(img); 
                        } 
                        else {
                            uploadedDocsBase64.push({
                                name: file.name,
                                size: (file.size / 1024).toFixed(0) + " KB",
                                data: e.target.result
                            });

                            const docPreview = document.createElement('div');
                            docPreview.style = 'padding:8px 12px; background:#f3f4f6; border-radius:6px; font-size:12px; display:flex; align-items:center; gap:5px; border:1px dashed #ccc;';
                            docPreview.innerHTML = `<i class="far fa-file-pdf" style="color:#ef4444;"></i> <span>${file.name}</span>`;
                            previewContainer.appendChild(docPreview); 
                        }
                    }
                    reader.readAsDataURL(file);
                });
            }
        });
    }

    const filterButtons = document.querySelectorAll(".filter-btn");
    const announcementCards = document.querySelectorAll(".announcement-card");

    if (filterButtons.length > 0) {
        filterButtons.forEach(button => {
            button.addEventListener("click", function () {
                filterButtons.forEach(btn => btn.classList.remove("active"));
                this.classList.add("active");

                const filterValue = this.getAttribute("data-filter");

                announcementCards.forEach(card => {
                    if (filterValue === "all") {
                        card.classList.remove("hide-card");
                    } else {
                        if (card.classList.contains(`border-${filterValue}`) || card.classList.contains(filterValue)) {
                            card.classList.remove("hide-card");
                        } else {
                            card.classList.add("hide-card");
                        }
                    }
                });
            });
        });
    }

    const menuToggle = document.getElementById('rbMenuToggle');
    const navBox = document.getElementById('rbNavBox');
    const overlay = document.getElementById('rbOverlay');

    if (menuToggle && navBox && overlay) {
        function toggleMenu() {
            menuToggle.classList.toggle('open');
            navBox.classList.toggle('open');
            overlay.classList.toggle('open');
        }
        menuToggle.addEventListener('click', toggleMenu);
        overlay.addEventListener('click', toggleMenu);
    }

    const savedData = localStorage.getItem("latestLossRequest");

    if (savedData) {
        const data = JSON.parse(savedData);

        if (data.fullName && document.getElementById("welcome-username")) {
            document.getElementById("welcome-username").innerText = "مرحباً بعودتك، " + data.fullName;
        }

        if (data.fullName && document.getElementById("roadmap-family-name")) {
            document.getElementById("roadmap-family-name").innerText = "عائلة " + data.fullName;
        }
        
        if (data.fullName && document.getElementById("chat-family-name")) {
            document.getElementById("chat-family-name").innerText = data.fullName;
        }

        if (data.fullAddress && document.getElementById("roadmap-location-name")) {
            document.getElementById("roadmap-location-name").innerText = data.fullAddress;
        }

        if (data.fullName) {
            const fullnameElem = document.getElementById("view-fullname");
            const stampElem = document.getElementById("view-fullname-stamp");
            if (fullnameElem) fullnameElem.innerText = data.fullName;
            if (stampElem) stampElem.innerText = data.fullName;
        }
        if (data.phone && document.getElementById("view-phone")) {
            document.getElementById("view-phone").innerText = data.phone;
        }
        if (data.email && document.getElementById("view-email")) {
            document.getElementById("view-email").innerText = data.email;
        }
        if (data.lossType) {
            if (document.getElementById("view-loss-type")) document.getElementById("view-loss-type").innerText = data.lossType;
            if (document.getElementById("view-banner-loss-type") && !document.getElementById("splash-screen")) {
                document.getElementById("view-banner-loss-type").innerText = "تقرير توثيق خسارة - " + data.lossType;
            }
        }
        if (data.fullAddress && document.getElementById("view-address")) {
            document.getElementById("view-address").innerHTML = `<i class="fas fa-map-marker-alt"></i> ${data.fullAddress}`;
        }

        const targetAmount = data.amount || "0";
        if (targetAmount && document.getElementById("view-amount")) {
            let amountStr = targetAmount.toString().trim();
            if (!amountStr.includes('$')) {
                const parsedNum = parseFloat(amountStr.replace(/[^0-9.]/g, ''));
                if (!isNaN(parsedNum)) {
                    amountStr = '$' + parsedNum.toLocaleString();
                } else {
                    amountStr = '$' + amountStr;
                }
            }
            document.getElementById("view-amount").innerText = amountStr;
        }
        
        const dateElement = document.getElementById("view-date");
        const timeElement = document.getElementById("view-time");
        const timeAgoElement = document.getElementById("view-time-ago"); 
        
        const savedDate = data.submissionDate;
        const savedTime = data.submissionTime;

        if (dateElement) {
            dateElement.innerText = savedDate ? savedDate : new Date().toLocaleDateString('ar-EG', { year: 'numeric', month: 'long', day: 'numeric' });
        }
        
        if (timeElement) {
            if (savedTime) {
                timeElement.innerText = savedTime.toString().includes('الساعة') ? savedTime : "الساعة " + savedTime;
            } else {
                const now = new Date();
                let hours = now.getHours();
                const minutes = now.getMinutes().toString().padStart(2, '0');
                const ampm = hours >= 12 ? 'مساءً' : 'صباحاً';
                hours = hours % 12 || 12;
                timeElement.innerText = `الساعة ${hours}:${minutes} ${ampm}`;
            }
        }

        if (timeAgoElement) {
            timeAgoElement.innerText = "الآن"; 
        }

        if (data.description && document.getElementById("view-description")) {
            document.getElementById("view-description").innerText = data.description;
        }
        if (data.familySize && document.getElementById("view-family-size")) {
            document.getElementById("view-family-size").innerText = data.familySize + " أفراد";
        }

        if (data.images && data.images.length > 0) {
            data.images.forEach((imgData, index) => {
                const boxElem = document.getElementById(`img-box-${index}`);
                if (boxElem) {
                    boxElem.style.backgroundImage = `url('${imgData.data}')`;
                    boxElem.style.backgroundSize = 'cover';
                    boxElem.style.backgroundPosition = 'center';
                    boxElem.innerHTML = `
                        <div class="photo-overlay-actions" style="opacity: 1; background: rgba(0,0,0,0.4);">
                            <button class="overlay-btn" onclick="window.open('${imgData.data}', '_blank')"><i class="far fa-eye"></i></button>
                            <a href="${imgData.data}" download="attachment-${index + 1}.png" class="overlay-btn" style="color:white; display:flex; align-items:center; justify-content:center; text-decoration:none;">
                                <i class="fas fa-download"></i>
                            </a>
                        </div>
                    `;
                }
            });
        }

        if (data.documents && data.documents.length > 0) {
            const pdfContainer = document.getElementById("view-pdf-container");
            if (pdfContainer) {
                pdfContainer.innerHTML = ""; 

                data.documents.forEach(doc => {
                    const pdfRow = document.createElement("div");
                    pdfRow.className = "pdf-row-item";
                    pdfRow.innerHTML = `
                        <div class="pdf-right-section">
                            <div class="pdf-icon-bg">
                                <i class="far fa-file-pdf pdf-red-icon"></i>
                            </div>
                            <div class="pdf-info-middle">
                                <span class="pdf-name">${doc.name}</span>
                                <span class="pdf-size">${doc.size}</span>
                            </div>
                        </div>
                        <a href="${doc.data}" download="${doc.name}" style="color: inherit; text-decoration: none;">
                            <i class="fas fa-download download-cloud-icon"></i>
                        </a>
                    `;
                    pdfContainer.appendChild(pdfRow);
                });
            }
        }
    }
});


function contactStatusManager() {
    const fullChatScreen = document.getElementById("fullChatScreen");
    if (fullChatScreen) {
        fullChatScreen.style.display = "flex"; 
        setTimeout(() => {
            const chatBody = document.getElementById("fullChatBody");
            if (chatBody) chatBody.scrollTop = chatBody.scrollHeight;
        }, 50);
    }
}

function backToRoadmap() {
    const fullChatScreen = document.getElementById("fullChatScreen");
    if (fullChatScreen) {
        fullChatScreen.style.display = "none";
    }
}

function sendFullChatMessage() {
    const input = document.getElementById("fullChatInput");
    const chatBody = document.getElementById("fullChatBody");
    
    if (input && input.value.trim() !== "") {
        const userMsg = document.createElement("div");
        userMsg.style = "align-self: flex-end; max-width: 75%; background: #1e3a8a; color: white; padding: 12px 15px; border-radius: 12px 0 12px 12px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); line-height: 1.6; font-size: 14px;";
        userMsg.innerHTML = `<p style="margin: 0;">${input.value}</p><span style="display: block; text-align: right; font-size: 10px; color: #93c5fd; margin-top: 5px;">الآن</span>`;
        
        chatBody.appendChild(userMsg);
        input.value = ""; 
        chatBody.scrollTop = chatBody.scrollHeight;
    }
}

function requestEdit() {
    let editModal = document.getElementById('editRequestModal');
    if (!editModal) {
        editModal = document.createElement('div');
        editModal.id = 'editRequestModal';
        editModal.style = "position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); display:flex; justify-content:center; align-items:center; z-index:99999; font-family:'Cairo', sans-serif;";
        
        editModal.innerHTML = `
            <div style="background:#fff; padding:25px; border-radius:12px; width:90%; max-width:450px; direction:rtl; text-align:right; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
                <h3 style="margin-top:0; color:#1e3a8a; border-bottom:2px solid #f3f4f6; padding-bottom:10px;"><i class="fa-solid fa-pen-to-square"></i> تقديم طلب تعديل بيانات</h3>
                <label style="display:block; margin:15px 0 5px; font-weight:600;">نوع التحديث المطلوب:</label>
                <select id="editType" style="width:100%; padding:10px; border:1px solid #ccc; border-radius:6px; font-family:inherit;">
                    <option value="water">تحديث حالة المياه</option>
                    <option value="electricity">تحديث حالة الكهرباء</option>
                    <option value="safety">تحديث حالة فحص السلامة</option>
                    <option value="other">تعديل بيانات العائلة / العنوان</option>
                </select>
                <label style="display:block; margin:15px 0 5px; font-weight:600;">تفاصيل التعديل أو الملاحظات:</label>
                <textarea id="editDetails" rows="4" placeholder="اكتب هنا التفاصيل التي ترغب في مراجعتها من قبل مسؤول الحالة..." style="width:100%; padding:10px; border:1px solid #ccc; border-radius:6px; font-family:inherit; resize:none;"></textarea>
                <div style="display:flex; gap:10px; margin-top:20px; justify-content:flex-end;">
                    <button onclick="submitEditForm()" style="background:#22c55e; color:#fff; border:none; padding:10px 20px; border-radius:6px; cursor:pointer; font-weight:600;">إرسال الطلب</button>
                    <button onclick="closeEditModal()" style="background:#ef4444; color:#fff; border:none; padding:10px 20px; border-radius:6px; cursor:pointer; font-weight:600;">إلغاء</button>
                </div>
            </div>
        `;
        document.body.appendChild(editModal);
    }
    editModal.style.display = 'flex';
}

function closeEditModal() {
    const editModal = document.getElementById('editRequestModal');
    if (editModal) editModal.style.display = 'none';
}

function submitEditForm() {
    const details = document.getElementById('editDetails').value;
    if (!details.trim()) {
        alert("الرجاء كتابة تفاصيل التعديل أولاً.");
        return;
    }
    alert("تم إرسال طلب التعديل بنجاح إلى مسؤول الحالة! سيتم مراجعة الطلب وتحديث الخارطة فوراً.");
    document.getElementById('editDetails').value = ""; 
    closeEditModal();
}