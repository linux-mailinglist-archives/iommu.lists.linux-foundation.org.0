Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F5528AEA8
	for <lists.iommu@lfdr.de>; Mon, 12 Oct 2020 09:01:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2479286951;
	Mon, 12 Oct 2020 07:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gzrer3FAANg; Mon, 12 Oct 2020 07:01:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B96678695F;
	Mon, 12 Oct 2020 07:01:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F1EAC0051;
	Mon, 12 Oct 2020 07:01:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33DBDC0051
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 07:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2FC7385DD8
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 07:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBgQ8Jb-SQIx for <iommu@lists.linux-foundation.org>;
 Mon, 12 Oct 2020 07:01:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BB19A85EA5
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 07:01:06 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id j7so2611797pgk.5
 for <iommu@lists.linux-foundation.org>; Mon, 12 Oct 2020 00:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Dk9FY/nJn0frIIrbXkmdD65Jdz2pGnIsws+uo7BvySQ=;
 b=fzDabeT97WHI8Z9P+TR9EIrwejaKIYvwhSXiqjOvL0b5H05Nkv3+9L2vs7HtSxd32s
 5I8nOwVM/zERhRZj2zK6Rf9nxRk/oJDqzH25fViaY80qRYGx2IxteDCU/fujoWSTAxNB
 QWaUJvkD3P8cglyACp2917gJJ/zW+UdtlC40dsf6rqnVLzpFKCdC2G6uFLJy/fzjJJk/
 fchE5jQTt7m7Vw7DR0+ewBIUrAOZluo6zeu5TdOFoh3OiNl1pRtwtr/VRT0+uutVxR5S
 f4IPcM8OmsWcnRWQgh0Z+q5JVzFgMr725sVsEXQ25qP0x8CaLTBsUewfVlZZYkpMNZqU
 mbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Dk9FY/nJn0frIIrbXkmdD65Jdz2pGnIsws+uo7BvySQ=;
 b=gssiNL7ZZKTg/E4hUeFcmhMwsus9PxvhBFSWb4ShlNA3fKsVsFJUbcE9A5c302eZT7
 PZHLnCsqndMkn8D2T1rlYbOpGtFRtts3LLx7rkLedKTj7EfZekf1f0MYCD0HzwgQQ6e6
 E+SS9In+CrhaNApPXyoW6N6FTxJNMLWNH83voZH5mf7WeJRzXUvwlN81UyOcUKQmEsD6
 zcKuCXzKqu/ELMM1iYzhOMr3Tug/j/DodZuIbAPGYT/S1QfuP13QYfAV8oy+Pz5Y5pF2
 gh9ohtqsvxpuhXEfdTJxfl4ax+WOolmGEjJ+AO+DKTV62RV3nwbeW4UpeYX4si0JIt+H
 S+jg==
X-Gm-Message-State: AOAM530suUg+9ycqTt5w0kz6I6YeVTUmUyD/Cs+q1Hh+yOM+5xfVXRWU
 h0DSNZPMMxNzdZpwoL8VwMY=
X-Google-Smtp-Source: ABdhPJwaKIZ4Jb0QKtlrdiAy0HtaklR1DFUyGkne6RIdbiAOFUJno68TD+Dv5Hp3BEdFxJZG9FqLIw==
X-Received: by 2002:aa7:954b:0:b029:154:8ee9:e4d with SMTP id
 w11-20020aa7954b0000b02901548ee90e4dmr23070781pfq.11.1602486066146; 
 Mon, 12 Oct 2020 00:01:06 -0700 (PDT)
Received: from AHUANG12-1LT7M0.lenovo.com
 (220-142-219-152.dynamic-ip.hinet.net. [220.142.219.152])
 by smtp.googlemail.com with ESMTPSA id j6sm18423285pfi.129.2020.10.12.00.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 00:01:05 -0700 (PDT)
From: Adrian Huang <adrianhuang0701@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu/amd: Remove unnecessary assignment
Date: Mon, 12 Oct 2020 15:00:46 +0800
Message-Id: <20201012070046.5479-1-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

From: Adrian Huang <ahuang12@lenovo.com>

The values of local variables are assigned after local variables
are declared, so no need to assign the initial value during the
variable declaration.

And, no need to assign NULL for the local variable 'ivrs_base' 
after invoking acpi_put_table().

Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
---
 drivers/iommu/amd/init.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 1ba6b4cc56e8..f171078f7ea0 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -1858,7 +1858,7 @@ static void print_iommu_info(void)
 static int __init amd_iommu_init_pci(void)
 {
 	struct amd_iommu *iommu;
-	int ret = 0;
+	int ret;
 
 	for_each_iommu(iommu) {
 		ret = iommu_init_pci(iommu);
@@ -2494,8 +2494,8 @@ static void __init free_dma_resources(void)
 static int __init early_amd_iommu_init(void)
 {
 	struct acpi_table_header *ivrs_base;
+	int i, remap_cache_sz, ret;
 	acpi_status status;
-	int i, remap_cache_sz, ret = 0;
 	u32 pci_id;
 
 	if (!amd_iommu_detected)
@@ -2637,7 +2637,6 @@ static int __init early_amd_iommu_init(void)
 out:
 	/* Don't leak any ACPI memory */
 	acpi_put_table(ivrs_base);
-	ivrs_base = NULL;
 
 	return ret;
 }
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
