Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF313C1F6
	for <lists.iommu@lfdr.de>; Wed, 15 Jan 2020 13:53:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 353D585DFD;
	Wed, 15 Jan 2020 12:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XiWUAkmWYpG0; Wed, 15 Jan 2020 12:53:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A2AA38531D;
	Wed, 15 Jan 2020 12:53:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CB97C077D;
	Wed, 15 Jan 2020 12:53:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4586C077D
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 12:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BF66820523
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 12:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWLdvGRrjAY2 for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:53:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id E1D8620525
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 12:53:42 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so17734444wmf.2
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 04:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k0PTgEa8Z2EtxKNp+bXlU3gMIeIQMMd4dvAJJmx7ucE=;
 b=dHOXOKHoTxItty8Q5696Mr+qbLuMsFa+MTSqKPLipIvl2oTCGz6ML1mpeZ/hKlDF/w
 0zv4zm331wgT2+KoHIxNr0EbnRGGQsLvPJyytnYPhCnUUDZJbkaemFEkNnu+UetF8/hv
 V63rc3osvZrEsMSG1CYkzOLHHYC2msMAlTjspE9QoVjnwGTB+KftSreLBNSx3XxcNWWz
 7qWRy0hn5i3tRV6yEIj4f9s5mv4xFHEO4sLGFIYhAVyLWiQK84QoCPspbr09hIqHacJb
 keyJbpDsHaUOhTQQceVDxe4Do+EaZFZskEG7KV/7urpQlMM39SamhpMjxm3wKwlF46iZ
 BDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k0PTgEa8Z2EtxKNp+bXlU3gMIeIQMMd4dvAJJmx7ucE=;
 b=RQ/0tL+1sY0eCB2Dc3LFOqdEFVTxvi7mE5+fqOl7D1x41CNq1SN/prryuK25FzWmSn
 Rn3RH9W+w12yjk7xAW77ud7vpQyqrMUB+kglACWXSsx9ksaNCRaQibiOVP82Bf9ne3ny
 XK/A+q5qImRYTdOKV9WyLEMtj2gFjxtNKIcTK4k29YfrlXtdXOVAx907yBHyD9wD8jKX
 yyKLRh9PhsckeAlh4oLG3N7CnY2s9PUTLIAwImIY6cEIXyN+b8qYASdNF4hf0hfA8OA8
 osDkt+KuQVMGP+ZiOSp31klixV+URxD6EwS1Cl/+RNAq/H8nynyJPaXIt2FU4/3ORPyr
 hYrw==
X-Gm-Message-State: APjAAAUHT/XE4w8IrPL9Jf3U/Xqq85EIXmBBmXr+D1qijaXz/IjyLUiV
 oX1AArPqTN2rRJF8G8OrByViiA==
X-Google-Smtp-Source: APXvYqw9Mt6OhEbO1QMqXTowh5t7SCfN3PgnBvH6KOJ1spMG2hboA0nCSsAfuEDMtgnKjfCtqj0iOg==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr34564949wmj.33.1579092821258; 
 Wed, 15 Jan 2020 04:53:41 -0800 (PST)
Received: from localhost.localdomain
 ([2001:171b:2266:ba60:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id d12sm25196171wrp.62.2020.01.15.04.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 04:53:40 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, will@kernel.org
Subject: [PATCH v5 12/13] PCI/ATS: Add PASID stubs
Date: Wed, 15 Jan 2020 13:52:38 +0100
Message-Id: <20200115125239.136759-13-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115125239.136759-1-jean-philippe@linaro.org>
References: <20200115125239.136759-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, guohanjun@huawei.com, rjw@rjwysocki.net,
 robh+dt@kernel.org, sudeep.holla@arm.com, bhelgaas@google.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com, lenb@kernel.org
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

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
