Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A638015C8C7
	for <lists.iommu@lfdr.de>; Thu, 13 Feb 2020 17:52:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6588386E89;
	Thu, 13 Feb 2020 16:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPnDYt-vvhbD; Thu, 13 Feb 2020 16:52:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 02E0186F9F;
	Thu, 13 Feb 2020 16:52:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4694C0177;
	Thu, 13 Feb 2020 16:52:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEB4FC0177
 for <iommu@lists.linux-foundation.org>; Thu, 13 Feb 2020 16:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9C51A8594B
 for <iommu@lists.linux-foundation.org>; Thu, 13 Feb 2020 16:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RRvuujvCg+d for <iommu@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 16:52:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2046884F76
 for <iommu@lists.linux-foundation.org>; Thu, 13 Feb 2020 16:52:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so7552453wma.1
 for <iommu@lists.linux-foundation.org>; Thu, 13 Feb 2020 08:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WDMFZWW+h59RhGdVycD2Uyjz5YXns4ww4oPwlirB1xs=;
 b=RU6hP0YaDVyg76DpwMt8+kokjDNdYK4t+fP1NMy86wohTGSpgKGZzXz22INLcb/uTG
 SulDKPmxKjSDX9mM1ObcytxPc9qSyfmoSueNx1WrVr+i2pcQ0/1MH6MfZipjLCRNhZ4R
 QAAwV9AK52wzbuAFhJ4wwljXxMGU1D8fjkRr3xz5yGktVvdi91XDhvfsXom1xAiav9Ca
 9EsxU47a4H/ESMgWlgX459A9KaDdxI8GrFEiHciqdGPUqbJk6r0x0gm/NOt1/yOdfV8m
 TYI4DrH7cKX39puiAtvbmBg0t24nmt6J4GV1r4c9AeQkOhtGKMzU9MsecC3L+ojmCMyI
 c2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WDMFZWW+h59RhGdVycD2Uyjz5YXns4ww4oPwlirB1xs=;
 b=BW69BVcvCU8AMBhDGyXk2jNclk7/CDR9ClNJf80AqBKp0OOMUIn0lTQBxOhgEPMOQi
 l+XAhWUoxJVNIpiPaZrF8Vc5/9pafvp7dHJmMgNZB/jABfqrnxmpYY8SoqKJCgwIZV3z
 JSmV3c46NELUPgIn3MdIXZFxltLsqID+jiG8PAD6SrmVrV4jp2eS5psTXnSpzm0BAx3U
 IysHx99/QHo//nLPN6HD/312MYLbYl6uZX2bePeRH3Po2aM132pSIPKAZXZH+6C75FHm
 Rw4ZKXSrB6xxHnQgvDz0zN9Appnv+E7jta7A7SEfF40kbpSOwQdgnTQ/5ZMFW58GhtZM
 21FA==
X-Gm-Message-State: APjAAAWhykHJZ43+KzPQBsFfOYHNsLK7aQH9uvfxTn073RvpvxgceTE9
 Z8rSkwCWxvz6OSwQHCqPkXBblg==
X-Google-Smtp-Source: APXvYqyTnYcfWPm44mmD/6D5Wm+c5cA7JDMBagRyfl9k+jEqNIeMmPTzO2182wwz9XUN7ktGp7/pbQ==
X-Received: by 2002:a1c:7d8b:: with SMTP id y133mr6917432wmc.165.1581612735514; 
 Thu, 13 Feb 2020 08:52:15 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y6sm3484807wrl.17.2020.02.13.08.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 08:52:15 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: bhelgaas@google.com, will@kernel.org, robh+dt@kernel.org,
 lorenzo.pieralisi@arm.com, joro@8bytes.org, baolu.lu@linux.intel.com,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: [PATCH 10/11] arm64: dts: fast models: Enable PCIe ATS for Base RevC
 FVP
Date: Thu, 13 Feb 2020 17:50:48 +0100
Message-Id: <20200213165049.508908-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213165049.508908-1-jean-philippe@linaro.org>
References: <20200213165049.508908-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, frowand.list@gmail.com, corbet@lwn.net,
 liviu.dudau@arm.com, sudeep.holla@arm.com, rjw@rjwysocki.net,
 guohanjun@huawei.com, amurray@thegoodpenguin.co.uk, robin.murphy@arm.com,
 dwmw2@infradead.org, lenb@kernel.org
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

Declare that the host controller supports ATS, so the OS can enable it
for ATS-capable PCIe endpoints.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
All endpoints support ATS provided they have the ats_supported=1 model
parameter. "lspci -vv" shows whether ATS is supported and enabled.
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 62ab0d54ff71..6e5bb7bcb4b3 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -170,6 +170,7 @@ pci: pci@40000000 {
 		iommu-map = <0x0 &smmu 0x0 0x10000>;
 
 		dma-coherent;
+		ats-supported;
 	};
 
 	smmu: smmu@2b400000 {
-- 
2.25.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
