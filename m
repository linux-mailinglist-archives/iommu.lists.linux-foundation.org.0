Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9621B57
	for <lists.iommu@lfdr.de>; Fri, 17 May 2019 18:17:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1BBAEC7C;
	Fri, 17 May 2019 16:17:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CBA87BA4
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 16:17:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 496C5885
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 16:17:00 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4HG7oIf117271
	for <iommu@lists.linux-foundation.org>; Fri, 17 May 2019 12:16:59 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2shxy9up2q-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <iommu@lists.linux-foundation.org>; Fri, 17 May 2019 12:16:59 -0400
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <iommu@lists.linux-foundation.org> from <pmorel@linux.ibm.com>;
	Fri, 17 May 2019 17:16:57 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Fri, 17 May 2019 17:16:53 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4HGGqSq18743538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 17 May 2019 16:16:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1313552067;
	Fri, 17 May 2019 16:16:52 +0000 (GMT)
Received: from morel-ThinkPad-W530.boeblingen.de.ibm.com (unknown
	[9.145.153.112])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7F1D35206D;
	Fri, 17 May 2019 16:16:51 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: sebott@linux.vnet.ibm.com
Subject: [PATCH v2 1/4] s390: pci: Exporting access to CLP PCI function and
	PCI group
Date: Fri, 17 May 2019 18:16:47 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558109810-18683-1-git-send-email-pmorel@linux.ibm.com>
References: <1558109810-18683-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19051716-4275-0000-0000-00000335E464
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051716-4276-0000-0000-0000384570A3
Message-Id: <1558109810-18683-2-git-send-email-pmorel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-17_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905170098
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, pasic@linux.vnet.ibm.com,
	alex.williamson@redhat.com, kvm@vger.kernel.org,
	heiko.carstens@de.ibm.com, walling@linux.ibm.com,
	linux-kernel@vger.kernel.org, borntraeger@de.ibm.com,
	iommu@lists.linux-foundation.org, schwidefsky@de.ibm.com,
	robin.murphy@arm.com, gerald.schaefer@de.ibm.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

For the generic implementation of VFIO PCI we need to retrieve
the hardware configuration for the PCI functions and the
PCI function groups.

We modify the internal function using CLP Query PCI function and
CLP query PCI function group so that they can be called from
outside the S390 architecture PCI code and prefix the two
functions with "zdev" to make clear that they can be called
knowing only the associated zdevice.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Sebastian Ott <sebott@linux.ibm.com>
---
 arch/s390/include/asm/pci.h |  3 ++
 arch/s390/pci/pci_clp.c     | 70 +++++++++++++++++++++++----------------------
 2 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
index 305befd..e66b246 100644
--- a/arch/s390/include/asm/pci.h
+++ b/arch/s390/include/asm/pci.h
@@ -261,4 +261,7 @@ cpumask_of_pcibus(const struct pci_bus *bus)
 
 #endif /* CONFIG_NUMA */
 
+int zdev_query_pci_fngrp(struct zpci_dev *zdev,
+			 struct clp_req_rsp_query_pci_grp *rrb);
+int zdev_query_pci_fn(struct zpci_dev *zdev, struct clp_req_rsp_query_pci *rrb);
 #endif
diff --git a/arch/s390/pci/pci_clp.c b/arch/s390/pci/pci_clp.c
index 3a36b07..c57f675 100644
--- a/arch/s390/pci/pci_clp.c
+++ b/arch/s390/pci/pci_clp.c
@@ -113,31 +113,16 @@ static void clp_store_query_pci_fngrp(struct zpci_dev *zdev,
 	}
 }
 
-static int clp_query_pci_fngrp(struct zpci_dev *zdev, u8 pfgid)
+int zdev_query_pci_fngrp(struct zpci_dev *zdev,
+			 struct clp_req_rsp_query_pci_grp *rrb)
 {
-	struct clp_req_rsp_query_pci_grp *rrb;
-	int rc;
-
-	rrb = clp_alloc_block(GFP_KERNEL);
-	if (!rrb)
-		return -ENOMEM;
-
 	memset(rrb, 0, sizeof(*rrb));
 	rrb->request.hdr.len = sizeof(rrb->request);
 	rrb->request.hdr.cmd = CLP_QUERY_PCI_FNGRP;
 	rrb->response.hdr.len = sizeof(rrb->response);
-	rrb->request.pfgid = pfgid;
+	rrb->request.pfgid = zdev->pfgid;
 
-	rc = clp_req(rrb, CLP_LPS_PCI);
-	if (!rc && rrb->response.hdr.rsp == CLP_RC_OK)
-		clp_store_query_pci_fngrp(zdev, &rrb->response);
-	else {
-		zpci_err("Q PCI FGRP:\n");
-		zpci_err_clp(rrb->response.hdr.rsp, rc);
-		rc = -EIO;
-	}
-	clp_free_block(rrb);
-	return rc;
+	return clp_req(rrb, CLP_LPS_PCI);
 }
 
 static int clp_store_query_pci_fn(struct zpci_dev *zdev,
@@ -174,32 +159,49 @@ static int clp_store_query_pci_fn(struct zpci_dev *zdev,
 	return 0;
 }
 
-static int clp_query_pci_fn(struct zpci_dev *zdev, u32 fh)
+int zdev_query_pci_fn(struct zpci_dev *zdev, struct clp_req_rsp_query_pci *rrb)
+{
+
+	memset(rrb, 0, sizeof(*rrb));
+	rrb->request.hdr.len = sizeof(rrb->request);
+	rrb->request.hdr.cmd = CLP_QUERY_PCI_FN;
+	rrb->response.hdr.len = sizeof(rrb->response);
+	rrb->request.fh = zdev->fh;
+
+	return clp_req(rrb, CLP_LPS_PCI);
+}
+
+static int clp_query_pci(struct zpci_dev *zdev)
 {
 	struct clp_req_rsp_query_pci *rrb;
+	struct clp_req_rsp_query_pci_grp *grrb;
 	int rc;
 
 	rrb = clp_alloc_block(GFP_KERNEL);
 	if (!rrb)
 		return -ENOMEM;
 
-	memset(rrb, 0, sizeof(*rrb));
-	rrb->request.hdr.len = sizeof(rrb->request);
-	rrb->request.hdr.cmd = CLP_QUERY_PCI_FN;
-	rrb->response.hdr.len = sizeof(rrb->response);
-	rrb->request.fh = fh;
-
-	rc = clp_req(rrb, CLP_LPS_PCI);
-	if (!rc && rrb->response.hdr.rsp == CLP_RC_OK) {
-		rc = clp_store_query_pci_fn(zdev, &rrb->response);
-		if (rc)
-			goto out;
-		rc = clp_query_pci_fngrp(zdev, rrb->response.pfgid);
-	} else {
+	rc = zdev_query_pci_fn(zdev, rrb);
+	if (rc || rrb->response.hdr.rsp != CLP_RC_OK) {
 		zpci_err("Q PCI FN:\n");
 		zpci_err_clp(rrb->response.hdr.rsp, rc);
 		rc = -EIO;
+		goto out;
 	}
+	rc = clp_store_query_pci_fn(zdev, &rrb->response);
+	if (rc)
+		goto out;
+
+	grrb = (struct clp_req_rsp_query_pci_grp *)rrb;
+	rc = zdev_query_pci_fngrp(zdev, grrb);
+	if (rc || grrb->response.hdr.rsp != CLP_RC_OK) {
+		zpci_err("Q PCI FGRP:\n");
+		zpci_err_clp(grrb->response.hdr.rsp, rc);
+		rc = -EIO;
+		goto out;
+	}
+	clp_store_query_pci_fngrp(zdev, &grrb->response);
+
 out:
 	clp_free_block(rrb);
 	return rc;
@@ -219,7 +221,7 @@ int clp_add_pci_device(u32 fid, u32 fh, int configured)
 	zdev->fid = fid;
 
 	/* Query function properties and update zdev */
-	rc = clp_query_pci_fn(zdev, fh);
+	rc = clp_query_pci(zdev);
 	if (rc)
 		goto error;
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
