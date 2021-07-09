Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADCA3C230F
	for <lists.iommu@lfdr.de>; Fri,  9 Jul 2021 13:43:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0408640001;
	Fri,  9 Jul 2021 11:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LowSKm6qpTSh; Fri,  9 Jul 2021 11:43:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2126441CFD;
	Fri,  9 Jul 2021 11:43:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB238C000E;
	Fri,  9 Jul 2021 11:43:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5A2CC000E;
 Fri,  9 Jul 2021 11:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3F0141CF8;
 Fri,  9 Jul 2021 11:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRgtauzIkc1A; Fri,  9 Jul 2021 11:43:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B1EA40001;
 Fri,  9 Jul 2021 11:43:52 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id a13so11737432wrf.10;
 Fri, 09 Jul 2021 04:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4tacrTa1KYqq7lXg+mzF/CJt/1c6utpjoK8omTLZME=;
 b=oNGLtXGXIoFMwIa036wXrbfFMueW3kI61BHBluXuo5x19NObr4xVi4S3nwuCEiOBq3
 acYTf7jJqXzj/ICXb9NFGGaQgtGXzjZPcvlbx1Ladh34m580+3PQIObC006JEWYaMepn
 LDfPMFM2xQk8i76Mj4CcNg0y7wxmEh12eug2gS+l6hMk1MI/RNBhKOv6uL+/VVCMDdmA
 wsNLmS+U5megEb2iw5xDR7G0qnzqsSBWVA71VeFcTX0pr6OZho2kVNR5U3bgsRJNfknf
 y03v7RfaFKg47HABdlK7PSSeGlnXw3QFhCpnR2omfGx3u2q0OXl3TbIqN214gxhhx1sq
 zFfQ==
X-Gm-Message-State: AOAM532UGNG/IcL039qOJlerQJNwoe3h4MJcdQImNc8vOCoe3x0X/NbN
 BK6ravzAmfhDmNAQvxa7NUU=
X-Google-Smtp-Source: ABdhPJztHl+FRLzminSGKcuTXml3YN3c0TWOwZ359TNjOY2ZSLDSMfRm60riREUrEuDHG/5lHotzOg==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr20350802wrm.220.1625831030382; 
 Fri, 09 Jul 2021 04:43:50 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z12sm4896849wrs.39.2021.07.09.04.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 04:43:50 -0700 (PDT)
From: Wei Liu <wei.liu@kernel.org>
To: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>
Subject: [RFC v1 6/8] mshv: command line option to skip devices in PV-IOMMU
Date: Fri,  9 Jul 2021 11:43:37 +0000
Message-Id: <20210709114339.3467637-7-wei.liu@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709114339.3467637-1-wei.liu@kernel.org>
References: <20210709114339.3467637-1-wei.liu@kernel.org>
MIME-Version: 1.0
Cc: Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, pasha.tatashin@soleen.com,
 kumarpraveen@linux.microsoft.com, Will Deacon <will@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org,
 Vineeth Pillai <viremana@linux.microsoft.com>
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

Some devices may have been claimed by the hypervisor already. One such
example is a user can assign a NIC for debugging purpose.

Ideally Linux should be able to tell retrieve that information, but
there is no way to do that yet. And designing that new mechanism is
going to take time.

Provide a command line option for skipping devices. This is a stopgap
solution, so it is intentionally undocumented. Hopefully we can retire
it in the future.

Signed-off-by: Wei Liu <wei.liu@kernel.org>
---
 drivers/iommu/hyperv-iommu.c | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
index 043dcff06511..353da5036387 100644
--- a/drivers/iommu/hyperv-iommu.c
+++ b/drivers/iommu/hyperv-iommu.c
@@ -349,6 +349,16 @@ static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
 
 #ifdef CONFIG_HYPERV_ROOT_PVIOMMU
 
+/* The IOMMU will not claim these PCI devices. */
+static char *pci_devs_to_skip;
+static int __init mshv_iommu_setup_skip(char *str) {
+	pci_devs_to_skip = str;
+
+	return 0;
+}
+/* mshv_iommu_skip=(SSSS:BB:DD.F)(SSSS:BB:DD.F) */
+__setup("mshv_iommu_skip=", mshv_iommu_setup_skip);
+
 /* DMA remapping support */
 struct hv_iommu_domain {
 	struct iommu_domain domain;
@@ -774,6 +784,41 @@ static struct iommu_device *hv_iommu_probe_device(struct device *dev)
 	if (!dev_is_pci(dev))
 		return ERR_PTR(-ENODEV);
 
+	/*
+	 * Skip the PCI device specified in `pci_devs_to_skip`. This is a
+	 * temporary solution until we figure out a way to extract information
+	 * from the hypervisor what devices it is already using.
+	 */
+	if (pci_devs_to_skip && *pci_devs_to_skip) {
+		int pos = 0;
+		int parsed;
+		int segment, bus, slot, func;
+		struct pci_dev *pdev = to_pci_dev(dev);
+
+		do {
+			parsed = 0;
+
+			sscanf(pci_devs_to_skip + pos,
+				" (%x:%x:%x.%x) %n",
+				&segment, &bus, &slot, &func, &parsed);
+
+			if (parsed <= 0)
+				break;
+
+			if (pci_domain_nr(pdev->bus) == segment &&
+				pdev->bus->number == bus &&
+				PCI_SLOT(pdev->devfn) == slot &&
+				PCI_FUNC(pdev->devfn) == func)
+			{
+				dev_info(dev, "skipped by MSHV IOMMU\n");
+				return ERR_PTR(-ENODEV);
+			}
+
+			pos += parsed;
+
+		} while (pci_devs_to_skip[pos]);
+	}
+
 	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
 	if (!vdev)
 		return ERR_PTR(-ENOMEM);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
