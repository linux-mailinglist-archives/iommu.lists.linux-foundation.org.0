Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 959711173B4
	for <lists.iommu@lfdr.de>; Mon,  9 Dec 2019 19:12:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4402687C41;
	Mon,  9 Dec 2019 18:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dpnrTWgA-TL; Mon,  9 Dec 2019 18:12:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC26488170;
	Mon,  9 Dec 2019 18:12:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB1E5C0881;
	Mon,  9 Dec 2019 18:12:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25754C0881
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 18:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 14ECB86A95
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 18:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRbDAbpM9r2D for <iommu@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 18:12:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B0C2386A8D
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 18:12:10 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a15so17240643wrf.9
 for <iommu@lists.linux-foundation.org>; Mon, 09 Dec 2019 10:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+bUNvcbVur0Ef2VA51V4gsgr3fHJGR70sEezlRR2RXc=;
 b=QWVvbh0Jpp5+Hw8827sqJaAjar+vbOSxAvAj30oTykn3fZunkMM+V0TpMe8znZSIwt
 kVb7o3GmlRpgmGRwqFd9IL7O0Rr/xOSf3Ou712l2rKwvJ+ientMioZnVc1lDF91iu51I
 UHJUu2zRarBoJs8L2yoNmEOFKcoFuBaNk3ypQxZ80un+15jE6DMxi+ZjCVVZZ43p9sG2
 IBBhzFgwwrNysh5v+q2LdP7dwwQvTzT0h9awcGtfIkraKUYda6YASGA0COj5K+NLIQlU
 vc+Klj7osrnuHxQ7nzumbvGR2a/QpWUNgVCUK01W87GXIit9vGNapGS5T4f3bqCJiksT
 E9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+bUNvcbVur0Ef2VA51V4gsgr3fHJGR70sEezlRR2RXc=;
 b=qwtLN8h87LTDm4rVlv7KVQLuarEbeoirsLNd/jO90WHAJTHvpjiHznXnv+VtyymNHA
 xIlctFheeC/SRlk3JNziFKvtdQA2dKndrYN/vrLsv91Q3lvNbHq2u5U9gEwoUUGrN1yq
 odxAAX9mT2g6aPibPok4HjqZ0iSawF4buEcPcAQ/jZvXoShHfCr3D5z9GKlJhpO+NsXq
 ltfDwGracFtkE2fbrxKeRaFZeJWgp+gO4CLL2IbcXrQ31T8yYpys0t/THpL+Cep0EyvU
 URYKzZX9Pksd29lVET+l8/Thx5S6RdX5n9zOPoiib6BSVbaPZfqJx8mBc5FI4siw15JE
 17WQ==
X-Gm-Message-State: APjAAAUd/dw6s4E/PFXpmY9GK1lkmt03ps/c9TMFlillcMQNRh1QMpyW
 w3QTmklRfxFbBX0C1Ln0SUHkWQ==
X-Google-Smtp-Source: APXvYqxZH+0s1tJzoncKkc0MLrscBtmGhCCKfuSL1rRjTgo9fxA1fKZvT0gterjHLEAe0aJZPngGUg==
X-Received: by 2002:a5d:4602:: with SMTP id t2mr3528279wrq.37.1575915129138;
 Mon, 09 Dec 2019 10:12:09 -0800 (PST)
Received: from localhost.localdomain (adsl-62-167-101-88.adslplus.ch.
 [62.167.101.88])
 by smtp.gmail.com with ESMTPSA id h2sm309838wrv.66.2019.12.09.10.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 10:12:08 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: [PATCH v3 12/13] PCI/ATS: Add PASID stubs
Date: Mon,  9 Dec 2019 19:05:13 +0100
Message-Id: <20191209180514.272727-13-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209180514.272727-1-jean-philippe@linaro.org>
References: <20191209180514.272727-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, robin.murphy@arm.com, guohanjun@huawei.com,
 rjw@rjwysocki.net, robh+dt@kernel.org, sudeep.holla@arm.com,
 bhelgaas@google.com, zhangfei.gao@linaro.org, will@kernel.org, lenb@kernel.org
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

The SMMUv3 driver, which may be built without CONFIG_PCI, will soon gain
PASID support.  Partially revert commit c6e9aefbf9db ("PCI/ATS: Remove
unused PRI and PASID stubs") to re-introduce the PASID stubs, and avoid
adding more #ifdefs to the SMMU driver.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/linux/pci-ats.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
index 5d62e78946a3..d08f0869f121 100644
--- a/include/linux/pci-ats.h
+++ b/include/linux/pci-ats.h
@@ -33,6 +33,9 @@ void pci_disable_pasid(struct pci_dev *pdev);
 int pci_pasid_features(struct pci_dev *pdev);
 int pci_max_pasids(struct pci_dev *pdev);
 #else /* CONFIG_PCI_PASID */
+static inline int pci_enable_pasid(struct pci_dev *pdev, int features)
+{ return -EINVAL; }
+static inline void pci_disable_pasid(struct pci_dev *pdev) { }
 static inline int pci_pasid_features(struct pci_dev *pdev)
 { return -EINVAL; }
 static inline int pci_max_pasids(struct pci_dev *pdev)
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
