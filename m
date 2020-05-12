Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1CC1CEBCE
	for <lists.iommu@lfdr.de>; Tue, 12 May 2020 06:09:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AA0292600E;
	Tue, 12 May 2020 04:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjMc17PPJEKU; Tue, 12 May 2020 04:09:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D9EFB2046F;
	Tue, 12 May 2020 04:09:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC000C016F;
	Tue, 12 May 2020 04:09:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59F53C016F
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 04:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 48F9E88970
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 04:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qsTu27WdnBgE for <iommu@lists.linux-foundation.org>;
 Tue, 12 May 2020 04:09:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CDB7988951
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 04:09:37 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f15so4820209plr.3
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 21:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6S28BNiWmQ/hEXUnU1MTnqXBi18kA3ePoZOYdtU1cwQ=;
 b=zKPMo9VxVy3jMqZvbDFZzd0rfMvjK8sIRqKU+RRM8fhiK3BsQbxVPPqNYrdq3CNlJp
 srwFwGJmFE53BiW8OELV7eGESL1CDt3+K4ya4VOcLbsiDUEhRhJL5Hsx5wYQmr4/a1ha
 npM2phtb/qYoGwQEx97t6GacPM8Z7YAe5eoPRlt84htL5JM81zMsdpd3BUasJ+/8QsnH
 dkV7TQ2UOgKSRXuw2IGL0NHMPpGwN/hPYlde9jC+uvFu5gspfztR7vKX+YVtfvubS0Zb
 /IgWuGFfL2eesthQolXE8F1dD/HdpBfJqLHJnovOiJQqYzfmg/aL8KblwwEQlXwQIPtH
 rPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6S28BNiWmQ/hEXUnU1MTnqXBi18kA3ePoZOYdtU1cwQ=;
 b=jeT3Zf0GW5MniCT78igsYgPkcs3qmXUBFqCY92rmUVqYG4KBhu/8Zs9esU8wxDIowu
 JZxhIiE2yqzeWtAmLUNW43qj0M1TRVyjBHmAIYDWTPm0jam87HOx6apbmTgVGnTdaDMS
 DEz/XlVLJqySFUJeRnDXCKePx2kE5bAaXK8JmCQYvu3Q3v02PlE0KnVHtiQ/zyhmhQ9g
 PL/GA5guiV3nge31aq3O5MUL5aHpBrOWmRIu34iowLhEVxW6Dt2EEnXi2bHMELGCHjOZ
 pgHY8thHIuyA70wfpB3dw1XvNx6xgmH72BTCZbNkbLNEDQvFVU/s4J83znFNui9azNIJ
 WAFA==
X-Gm-Message-State: AGi0PuZwLLyvngj03Yf65S46mVbAKrMO+0FlGO9REan99F5hFikGwpRl
 E0ikChirUUp1IZGszsOZv97BnQ==
X-Google-Smtp-Source: APiQypIz5wcptWAsZSR4zFqLILzJ6EQ/AyMRL3bPtWuTsky6Bgy54mQMi2/qmxe6ZV1FPbWCHDML+A==
X-Received: by 2002:a17:902:728e:: with SMTP id
 d14mr18153543pll.107.1589256577364; 
 Mon, 11 May 2020 21:09:37 -0700 (PDT)
Received: from localhost.localdomain ([240e:362:443:6f00:91af:f25c:441c:7ba4])
 by smtp.gmail.com with ESMTPSA id
 e4sm9471527pge.45.2020.05.11.21.09.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 21:09:36 -0700 (PDT)
From: Zhangfei Gao <zhangfei.gao@linaro.org>
To: Joerg Roedel <joro@8bytes.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 jean-philippe <jean-philippe@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, kenneth-lee-2012@foxmail.com,
 Wangzhou <wangzhou1@hisilicon.com>
Subject: [PATCH 2/2] ACPI/IORT: Let pci_fixup_final access iommu_fwnode
Date: Tue, 12 May 2020 12:08:31 +0800
Message-Id: <1589256511-12446-3-git-send-email-zhangfei.gao@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589256511-12446-1-git-send-email-zhangfei.gao@linaro.org>
References: <1589256511-12446-1-git-send-email-zhangfei.gao@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 Zhangfei Gao <zhangfei.gao@linaro.org>, linux-arm-kernel@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Calling pci_fixup_final after iommu_fwspec_init, which alloc
iommu_fwnode. Some platform devices appear as PCI but are
actually on the AMBA bus, and they need fixup in
drivers/pci/quirks.c handling iommu_fwnode.
So calling pci_fixup_final after iommu_fwnode is allocated.

Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
---
 drivers/acpi/arm64/iort.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 7d04424..02e361d 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1027,6 +1027,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		info.node = node;
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
 					     iort_pci_iommu_init, &info);
+		pci_fixup_device(pci_fixup_final, to_pci_dev(dev));
 
 		fwspec = dev_iommu_fwspec_get(dev);
 		if (fwspec && iort_pci_rc_supports_ats(node))
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
