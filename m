Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB524D8D20
	for <lists.iommu@lfdr.de>; Mon, 14 Mar 2022 20:49:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E25408C4;
	Mon, 14 Mar 2022 19:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8R-kG5TVsdD; Mon, 14 Mar 2022 19:49:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7EF7440894;
	Mon, 14 Mar 2022 19:49:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 646DFC0084;
	Mon, 14 Mar 2022 19:49:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51BDDC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 19:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FFA560C03
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JuzPqYCgVcfP for <iommu@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 19:49:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 364246058D
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 19:49:49 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EJlYEG009600; 
 Mon, 14 Mar 2022 19:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Rukf6hxdc5Cvc2UvGf+f3fW9F/+5zGrKvDRTCwPKMLI=;
 b=OwTBiWDQ8qhfJcM+toSgw+iH31YRcQ0t1Bxxg/cvN777eKQifXyleJoOwlegmUHYNymL
 kMpFxIjijZQ3sJZ+dxSWsrZroPHeBLZJjW7hfTdKh+X/OuGOCX/SzE9aXSnRJfi2CHQe
 cPCiD0y04yMnV0H++1sQBDuFkqnsfVjtwVHylF9McynTKlLdxxzbg5obOYh8ujD2iE21
 thA6b3FiFHjDzV4V5mE5R5lYOOJ4VUnOnlWKOuXvQwRf0JiBTDZKbjAAB+v7t5g2OXsu
 8djT59oVciGgwAJ79yZdY7gm3Yky5SsWZG1+ArYrIReuRMJZMycVfPEAaRIkHxJzZ1qK Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d2rgbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:49:44 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EJni8m014656;
 Mon, 14 Mar 2022 19:49:44 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d2rgb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:49:44 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EJm3Nq002522;
 Mon, 14 Mar 2022 19:49:43 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3erk58r998-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:49:43 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EJnfFI19071406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 19:49:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B18E511206D;
 Mon, 14 Mar 2022 19:49:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22D04112062;
 Mon, 14 Mar 2022 19:49:32 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.184]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 19:49:31 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: linux-s390@vger.kernel.org
Subject: [PATCH v4 28/32] KVM: s390: add KVM_S390_ZPCI_OP to manage guest zPCI
 devices
Date: Mon, 14 Mar 2022 15:44:47 -0400
Message-Id: <20220314194451.58266-29-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220314194451.58266-1-mjrosato@linux.ibm.com>
References: <20220314194451.58266-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hCsCAJu-jizyCyNR8Y0C-siQi8hsCApC
X-Proofpoint-ORIG-GUID: m7Ak6J_qCuMGdpAwSzcesPjuOmmclRkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_13,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=842 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0
 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140116
Cc: kvm@vger.kernel.org, david@redhat.com, thuth@redhat.com,
 linux-kernel@vger.kernel.org, vneethv@linux.ibm.com, agordeev@linux.ibm.com,
 imbrenda@linux.ibm.com, will@kernel.org, frankja@linux.ibm.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, pasic@linux.ibm.com, jgg@nvidia.com,
 gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 gor@linux.ibm.com, schnelle@linux.ibm.com, hca@linux.ibm.com,
 alex.williamson@redhat.com, freude@linux.ibm.com, pmorel@linux.ibm.com,
 cohuck@redhat.com, oberpar@linux.ibm.com, iommu@lists.linux-foundation.org,
 svens@linux.ibm.com, pbonzini@redhat.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The KVM_S390_ZPCI_OP ioctl provides a series of operations that
can be invoked to manage hardware-assisted virtualization features
for s390x PCI passthrough.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst | 60 ++++++++++++++++++++++++++
 arch/s390/kvm/kvm-s390.c       | 26 ++++++++++++
 arch/s390/kvm/pci.c            | 77 ++++++++++++++++++++++++++++++++++
 arch/s390/kvm/pci.h            |  3 +-
 include/uapi/linux/kvm.h       | 43 +++++++++++++++++++
 5 files changed, 208 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 9f3172376ec3..c642ff891cf2 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -5574,6 +5574,66 @@ enabled with ``arch_prctl()``, but this may change in the future.
 The offsets of the state save areas in struct kvm_xsave follow the contents
 of CPUID leaf 0xD on the host.
 
+4.134 KVM_S390_ZPCI_OP
+--------------------
+
+:Capability: KVM_CAP_S390_ZPCI_OP
+:Architectures: s390
+:Type: vcpu ioctl
+:Parameters: struct kvm_s390_zpci_op (in, out)
+:Returns: 0 on success, <0 on error
+
+Used to manage hardware-assisted virtualization features for zPCI devices.
+
+Parameters are specified via the following structure::
+
+  struct kvm_s390_zpci_op {
+	/* in */
+	__u32 fh;		/* target device */
+	__u8  op;		/* operation to perform */
+	__u8  pad[3];
+	union {
+		/* for KVM_S390_ZPCIOP_REG_INT */
+		struct {
+			__u64 ibv;	/* Guest addr of interrupt bit vector */
+			__u64 sb;	/* Guest addr of summary bit */
+			__u32 flags;
+			__u32 noi;	/* Number of interrupts */
+			__u8 isc;	/* Guest interrupt subclass */
+			__u8 sbo;	/* Offset of guest summary bit vector */
+			__u16 pad;
+		} reg_int;
+		/* for KVM_S390_ZPCIOP_REG_IOAT */
+		struct {
+			__u64 iota;	/* I/O Translation settings */
+		} reg_ioat;
+		__u8 reserved[64];
+	} u;
+	/* out */
+	__u32 newfh;		/* updated device handle */
+  };
+
+The type of operation is specified in the "op" field.
+KVM_S390_ZPCIOP_INIT is used to assocaite a zPCI function with this vm.
+Conversely, KVM_S390_ZPCIOP_END is used to terminate that association.
+KVM_S390_ZPCIOP_START_INTERP is used to enable interpretive execution
+for the specified zPCI function for this VM; KVM_S390_ZPCIOP_STOP_INTERP
+is used to subsequently disable interpretive execution.
+KVM_S390_ZPCIOP_REG_INT is used to register the VM for adapter interruption
+forwarding, which will allow firmware delivery of interrupts directly to
+the vm, with KVM providing a backup delivery mechanism;
+KVM_S390_ZPCIOP_DEREG_INT is used to subsequently disable interrupt forwarding.
+KVM_S390_ZPCIOP_REG_IOAT is used to enable KVM-managed IOMMU ops to begin
+synchronizing guest and host DMA tables; KVM_S390_ZPCIOP_DEREG_IOAT is used
+to subsequently disable IOMMU mapping.
+
+The target zPCI function must also be specified via the "fh" field.  For the
+KVM_S390_ZPCIOP_REG_INT operation, additional information to establish the
+interrupt forwarding must be provided via the "reg_int" struct.  For the
+KVM_S390_ZPCIOP_REG_IOAT operation, guest table format and location must be
+specified via the "reg_ioat" struct.
+
+The "reserved" field is meant for future extensions.
 
 5. The kvm_run structure
 ========================
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 84acaf59a7d3..613101ba29be 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -616,6 +616,15 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_S390_PROTECTED:
 		r = is_prot_virt_host();
 		break;
+	case KVM_CAP_S390_ZPCI_OP:
+		if (IS_ENABLED(CONFIG_S390_KVM_IOMMU) && test_facility(69) &&
+		    test_facility(70) && test_facility(71) &&
+		    test_facility(72)) {
+			r = 1;
+		} else {
+			r = 0;
+		}
+		break;
 	default:
 		r = 0;
 	}
@@ -2532,6 +2541,23 @@ long kvm_arch_vm_ioctl(struct file *filp,
 		}
 		break;
 	}
+	case KVM_S390_ZPCI_OP: {
+		struct kvm_s390_zpci_op args;
+
+		r = -EINVAL;
+		if (!IS_ENABLED(CONFIG_VFIO_PCI))
+			break;
+		if (copy_from_user(&args, argp, sizeof(args))) {
+			r = -EFAULT;
+			break;
+		}
+		r = kvm_s390_pci_zpci_op(kvm, &args);
+		if (r)
+			break;
+		if (copy_to_user(argp, &args, sizeof(args)))
+			r = -EFAULT;
+		break;
+	}
 	default:
 		r = -ENOTTY;
 	}
diff --git a/arch/s390/kvm/pci.c b/arch/s390/kvm/pci.c
index 40d2fadbfbd5..15b581915cd7 100644
--- a/arch/s390/kvm/pci.c
+++ b/arch/s390/kvm/pci.c
@@ -739,6 +739,83 @@ void kvm_s390_pci_clear_list(struct kvm *kvm)
 	}
 }
 
+static int kvm_s390_pci_zpci_reg_int(struct zpci_dev *zdev,
+				     struct kvm_s390_zpci_op *args)
+{
+	struct zpci_fib fib = {};
+
+	fib.fmt0.aibv = args->u.reg_int.ibv;
+	fib.fmt0.isc = args->u.reg_int.isc;
+	fib.fmt0.noi = args->u.reg_int.noi;
+	if (args->u.reg_int.sb != 0) {
+		fib.fmt0.aisb = args->u.reg_int.sb;
+		fib.fmt0.aisbo = args->u.reg_int.sbo;
+		fib.fmt0.sum = 1;
+	} else {
+		fib.fmt0.aisb = 0;
+		fib.fmt0.aisbo = 0;
+		fib.fmt0.sum = 0;
+	}
+
+	if (args->u.reg_int.flags & KVM_S390_ZPCIOP_REGINT_HOST)
+		return kvm_s390_pci_aif_enable(zdev, &fib, true);
+	else
+		return kvm_s390_pci_aif_enable(zdev, &fib, false);
+}
+
+int kvm_s390_pci_zpci_op(struct kvm *kvm, struct kvm_s390_zpci_op *args)
+{
+	struct kvm_zdev *kzdev;
+	struct zpci_dev *zdev;
+	int r;
+
+	if (args->op == KVM_S390_ZPCIOP_INIT) {
+		zdev = get_zdev_by_fh(args->fh);
+		if (!zdev)
+			return -ENODEV;
+	} else {
+		kzdev = get_kzdev_by_fh(kvm, args->fh);
+		if (!kzdev || !kzdev->zdev)
+			return -ENODEV;
+		zdev = kzdev->zdev;
+	}
+
+	switch (args->op) {
+	case KVM_S390_ZPCIOP_INIT:
+		r = kvm_s390_pci_zpci_start(kvm, zdev);
+		break;
+	case KVM_S390_ZPCIOP_END:
+		r = kvm_s390_pci_zpci_stop(kvm, zdev);
+		break;
+	case KVM_S390_ZPCIOP_START_INTERP:
+		r = kvm_s390_pci_interp_enable(zdev);
+		break;
+	case KVM_S390_ZPCIOP_STOP_INTERP:
+		r = kvm_s390_pci_interp_disable(zdev, false);
+		break;
+	case KVM_S390_ZPCIOP_REG_INT:
+		r = kvm_s390_pci_zpci_reg_int(zdev, args);
+		break;
+	case KVM_S390_ZPCIOP_DEREG_INT:
+		r = kvm_s390_pci_aif_disable(zdev, false);
+		break;
+	case KVM_S390_ZPCIOP_REG_IOAT:
+		r = kvm_s390_pci_ioat_enable(zdev, args->u.reg_ioat.iota);
+		break;
+	case KVM_S390_ZPCIOP_DEREG_IOAT:
+		r = kvm_s390_pci_ioat_disable(zdev);
+		break;
+	default:
+		r = -EINVAL;
+	}
+
+	/* On success, always return the current host function handle */
+	if (r == 0)
+		args->newfh = zdev->fh;
+
+	return r;
+}
+
 int kvm_s390_pci_init(void)
 {
 	int rc;
diff --git a/arch/s390/kvm/pci.h b/arch/s390/kvm/pci.h
index 2cb1b27396c1..c30b0bacca00 100644
--- a/arch/s390/kvm/pci.h
+++ b/arch/s390/kvm/pci.h
@@ -12,6 +12,7 @@
 
 #include <linux/pci.h>
 #include <linux/mutex.h>
+#include <linux/kvm.h>
 #include <linux/kvm_host.h>
 #include <asm/airq.h>
 #include <asm/kvm_pci.h>
@@ -56,7 +57,7 @@ int kvm_s390_pci_zpci_start(struct kvm *kvm, struct zpci_dev *zdev);
 int kvm_s390_pci_zpci_stop(struct kvm *kvm, struct zpci_dev *zdev);
 void kvm_s390_pci_init_list(struct kvm *kvm);
 void kvm_s390_pci_clear_list(struct kvm *kvm);
-
+int kvm_s390_pci_zpci_op(struct kvm *kvm, struct kvm_s390_zpci_op *args);
 int kvm_s390_pci_init(void);
 
 #endif /* __KVM_S390_PCI_H */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 507ee1f2aa96..be8693ccc833 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1135,6 +1135,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_XSAVE2 208
 #define KVM_CAP_SYS_ATTRIBUTES 209
 #define KVM_CAP_PPC_AIL_MODE_3 210
+#define KVM_CAP_S390_ZPCI_OP 211
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -2049,4 +2050,46 @@ struct kvm_stats_desc {
 /* Available with KVM_CAP_XSAVE2 */
 #define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
 
+/* Available with KVM_CAP_S390_ZPCI_OP */
+#define KVM_S390_ZPCI_OP	  _IOW(KVMIO,  0xd0, struct kvm_s390_zpci_op)
+
+struct kvm_s390_zpci_op {
+	/* in */
+	__u32 fh;		/* target device */
+	__u8  op;		/* operation to perform */
+	__u8  pad[3];
+	union {
+		/* for KVM_S390_ZPCIOP_REG_INT */
+		struct {
+			__u64 ibv;	/* Guest addr of interrupt bit vector */
+			__u64 sb;	/* Guest addr of summary bit */
+			__u32 flags;
+			__u32 noi;	/* Number of interrupts */
+			__u8 isc;	/* Guest interrupt subclass */
+			__u8 sbo;	/* Offset of guest summary bit vector */
+			__u16 pad;
+		} reg_int;
+		/* for KVM_S390_ZPCIOP_REG_IOAT */
+		struct {
+			__u64 iota;	/* I/O Translation settings */
+		} reg_ioat;
+		__u8 reserved[64];
+	} u;
+	/* out */
+	__u32 newfh;		/* updated device handle */
+};
+
+/* types for kvm_s390_zpci_op->op */
+#define KVM_S390_ZPCIOP_INIT		0
+#define KVM_S390_ZPCIOP_END		1
+#define KVM_S390_ZPCIOP_START_INTERP	2
+#define KVM_S390_ZPCIOP_STOP_INTERP	3
+#define KVM_S390_ZPCIOP_REG_INT		4
+#define KVM_S390_ZPCIOP_DEREG_INT	5
+#define KVM_S390_ZPCIOP_REG_IOAT	6
+#define KVM_S390_ZPCIOP_DEREG_IOAT	7
+
+/* flags for kvm_s390_zpci_op->u.reg_int.flags */
+#define KVM_S390_ZPCIOP_REGINT_HOST	(1 << 0)
+
 #endif /* __LINUX_KVM_H */
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
