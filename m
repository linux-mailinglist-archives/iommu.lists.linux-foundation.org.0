Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCC4D8CCD
	for <lists.iommu@lfdr.de>; Mon, 14 Mar 2022 20:46:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F44882435;
	Mon, 14 Mar 2022 19:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OwqZOddxkcYG; Mon, 14 Mar 2022 19:46:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 18F99823DD;
	Mon, 14 Mar 2022 19:46:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5F4FC000B;
	Mon, 14 Mar 2022 19:46:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D585C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 19:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A4D2823DD
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 19:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDiC_aeSGYwo for <iommu@lists.linux-foundation.org>;
 Mon, 14 Mar 2022 19:46:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5624481911
 for <iommu@lists.linux-foundation.org>; Mon, 14 Mar 2022 19:46:35 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EGq5io013379; 
 Mon, 14 Mar 2022 19:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EQDsWtMF/LBxZahEuyNpcGWMsp8yhzVXzepnQq4Ks4E=;
 b=mGYp2/oyq5CC0OTxNGv+NLr7z+hBpOcOJIrRJOjE7+9DYYxpa9gtg2mPv1mA1WmvHTRt
 +MEmKotegxer76wcjCVb42X2ToD0RYOCnOvYRDI8xAwAJ+C+sUqqWy2wieqHcMuDEe/I
 XhNimqh53IcedNCDrZC4x6Xxpx2Ppj6yA7mxY/Ao/TfgErUcTP6lWHUDJjU/5WHTCQm2
 78IMyjXQQTrb9eurqDtWo/0ijdrND0MNmwX/0X8eJFsdO7RBOnd7N2Cp2vI6GkcsLHHn
 Kxz6B3gg+A2vhYwnaHe62QAknidv2S9bi0idjvXTL/NTzUoYbX+JoVMb1/b67Xv+ZP0V GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d6rheb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:46:28 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EJhFWb021680;
 Mon, 14 Mar 2022 19:46:28 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d6rhe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:46:28 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EJNBlh009051;
 Mon, 14 Mar 2022 19:46:27 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3erk59g7sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:46:27 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EJkPG921496102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 19:46:25 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B22B8112064;
 Mon, 14 Mar 2022 19:46:25 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35BB2112061;
 Mon, 14 Mar 2022 19:46:16 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.184]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 19:46:15 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: linux-s390@vger.kernel.org
Subject: [PATCH v4 08/32] s390/pci: stash associated GISA designation
Date: Mon, 14 Mar 2022 15:44:27 -0400
Message-Id: <20220314194451.58266-9-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220314194451.58266-1-mjrosato@linux.ibm.com>
References: <20220314194451.58266-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NQKK8NOEVbDhMs_IVv48_Lh8D7R5JUGE
X-Proofpoint-ORIG-GUID: TQ9PShYI93uXGHWku6RhSXeHD3cdZXtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_13,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=679 mlxscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203140116
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

For passthrough devices, we will need to know the GISA designation of the
guest if interpretation facilities are to be used.  Setup to stash this in
the zdev and set a default of 0 (no GISA designation) for now; a subsequent
patch will set a valid GISA designation for passthrough devices.
Also, extend mpcific routines to specify this stashed designation as part
of the mpcific command.

Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 arch/s390/include/asm/pci.h     | 1 +
 arch/s390/include/asm/pci_clp.h | 3 ++-
 arch/s390/pci/pci.c             | 6 ++++++
 arch/s390/pci/pci_clp.c         | 1 +
 arch/s390/pci/pci_irq.c         | 5 +++++
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
index 90824be5ce9a..d07d7c3205de 100644
--- a/arch/s390/include/asm/pci.h
+++ b/arch/s390/include/asm/pci.h
@@ -123,6 +123,7 @@ struct zpci_dev {
 	enum zpci_state state;
 	u32		fid;		/* function ID, used by sclp */
 	u32		fh;		/* function handle, used by insn's */
+	u32		gisa;		/* GISA designation for passthrough */
 	u16		vfn;		/* virtual function number */
 	u16		pchid;		/* physical channel ID */
 	u8		pfgid;		/* function group ID */
diff --git a/arch/s390/include/asm/pci_clp.h b/arch/s390/include/asm/pci_clp.h
index 1f4b666e85ee..f3286bc5ba6e 100644
--- a/arch/s390/include/asm/pci_clp.h
+++ b/arch/s390/include/asm/pci_clp.h
@@ -173,7 +173,8 @@ struct clp_req_set_pci {
 	u16 reserved2;
 	u8 oc;				/* operation controls */
 	u8 ndas;			/* number of dma spaces */
-	u64 reserved3;
+	u32 reserved3;
+	u32 gisa;			/* GISA designation */
 } __packed;
 
 /* Set PCI function response */
diff --git a/arch/s390/pci/pci.c b/arch/s390/pci/pci.c
index 792f8e0f2178..ca9c29386de6 100644
--- a/arch/s390/pci/pci.c
+++ b/arch/s390/pci/pci.c
@@ -119,6 +119,7 @@ int zpci_register_ioat(struct zpci_dev *zdev, u8 dmaas,
 	fib.pba = base;
 	fib.pal = limit;
 	fib.iota = iota | ZPCI_IOTA_RTTO_FLAG;
+	fib.gd = zdev->gisa;
 	cc = zpci_mod_fc(req, &fib, &status);
 	if (cc)
 		zpci_dbg(3, "reg ioat fid:%x, cc:%d, status:%d\n", zdev->fid, cc, status);
@@ -132,6 +133,8 @@ int zpci_unregister_ioat(struct zpci_dev *zdev, u8 dmaas)
 	struct zpci_fib fib = {0};
 	u8 cc, status;
 
+	fib.gd = zdev->gisa;
+
 	cc = zpci_mod_fc(req, &fib, &status);
 	if (cc)
 		zpci_dbg(3, "unreg ioat fid:%x, cc:%d, status:%d\n", zdev->fid, cc, status);
@@ -159,6 +162,7 @@ int zpci_fmb_enable_device(struct zpci_dev *zdev)
 	atomic64_set(&zdev->unmapped_pages, 0);
 
 	fib.fmb_addr = virt_to_phys(zdev->fmb);
+	fib.gd = zdev->gisa;
 	cc = zpci_mod_fc(req, &fib, &status);
 	if (cc) {
 		kmem_cache_free(zdev_fmb_cache, zdev->fmb);
@@ -177,6 +181,8 @@ int zpci_fmb_disable_device(struct zpci_dev *zdev)
 	if (!zdev->fmb)
 		return -EINVAL;
 
+	fib.gd = zdev->gisa;
+
 	/* Function measurement is disabled if fmb address is zero */
 	cc = zpci_mod_fc(req, &fib, &status);
 	if (cc == 3) /* Function already gone. */
diff --git a/arch/s390/pci/pci_clp.c b/arch/s390/pci/pci_clp.c
index be077b39da33..4dcc37ddeeaf 100644
--- a/arch/s390/pci/pci_clp.c
+++ b/arch/s390/pci/pci_clp.c
@@ -240,6 +240,7 @@ static int clp_set_pci_fn(struct zpci_dev *zdev, u32 *fh, u8 nr_dma_as, u8 comma
 		rrb->request.fh = zdev->fh;
 		rrb->request.oc = command;
 		rrb->request.ndas = nr_dma_as;
+		rrb->request.gisa = zdev->gisa;
 
 		rc = clp_req(rrb, CLP_LPS_PCI);
 		if (rrb->response.hdr.rsp == CLP_RC_SETPCIFN_BUSY) {
diff --git a/arch/s390/pci/pci_irq.c b/arch/s390/pci/pci_irq.c
index 2f675355fd0c..a19ac0282929 100644
--- a/arch/s390/pci/pci_irq.c
+++ b/arch/s390/pci/pci_irq.c
@@ -43,6 +43,7 @@ static int zpci_set_airq(struct zpci_dev *zdev)
 	fib.fmt0.aibvo = 0;	/* each zdev has its own interrupt vector */
 	fib.fmt0.aisb = virt_to_phys(zpci_sbv->vector) + (zdev->aisb / 64) * 8;
 	fib.fmt0.aisbo = zdev->aisb & 63;
+	fib.gd = zdev->gisa;
 
 	return zpci_mod_fc(req, &fib, &status) ? -EIO : 0;
 }
@@ -54,6 +55,8 @@ static int zpci_clear_airq(struct zpci_dev *zdev)
 	struct zpci_fib fib = {0};
 	u8 cc, status;
 
+	fib.gd = zdev->gisa;
+
 	cc = zpci_mod_fc(req, &fib, &status);
 	if (cc == 3 || (cc == 1 && status == 24))
 		/* Function already gone or IRQs already deregistered. */
@@ -72,6 +75,7 @@ static int zpci_set_directed_irq(struct zpci_dev *zdev)
 	fib.fmt = 1;
 	fib.fmt1.noi = zdev->msi_nr_irqs;
 	fib.fmt1.dibvo = zdev->msi_first_bit;
+	fib.gd = zdev->gisa;
 
 	return zpci_mod_fc(req, &fib, &status) ? -EIO : 0;
 }
@@ -84,6 +88,7 @@ static int zpci_clear_directed_irq(struct zpci_dev *zdev)
 	u8 cc, status;
 
 	fib.fmt = 1;
+	fib.gd = zdev->gisa;
 	cc = zpci_mod_fc(req, &fib, &status);
 	if (cc == 3 || (cc == 1 && status == 24))
 		/* Function already gone or IRQs already deregistered. */
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
