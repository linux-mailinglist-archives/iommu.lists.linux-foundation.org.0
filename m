Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E09107B56
	for <lists.iommu@lfdr.de>; Sat, 23 Nov 2019 00:31:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6B893203FC;
	Fri, 22 Nov 2019 23:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPkHT8FndTyP; Fri, 22 Nov 2019 23:31:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 30C8D203DA;
	Fri, 22 Nov 2019 23:31:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 744EBC18DA;
	Fri, 22 Nov 2019 23:31:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC0FDC18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B6732879F8
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHNplK--jBeA for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 23:31:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-21.smtp-out.us-west-2.amazonses.com
 (a27-21.smtp-out.us-west-2.amazonses.com [54.240.27.21])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 102B782067
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574465511;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=LVP5fItJG7eJG5QBHWGLQQXnPsRB9cfJVZahjRJMFLw=;
 b=joZpgE7q4HwqGWpdjroZXElVonKovA1SiP41zBNS3rb1tBH6sAu6rQTBFZT0VUkx
 geWkQv1B2OfnMNcM1AV54lJTfM5MJs5kpgTHxT115TpuKafxXITJMDhnYRIHlIQdKhq
 3vj2mj+D1ESu4vtFAVWe5JUtfY+sgVIp5yHywY50=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574465511;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=LVP5fItJG7eJG5QBHWGLQQXnPsRB9cfJVZahjRJMFLw=;
 b=UTg4DWwG/Zwk5K5iCHmWA2aynfW5G+0xqVlZ1AID3Mv5Us0dTJyfPNl3gKPP39pH
 3MitxEc9IcNHqLhAwnfllL7Bof+iNhR+lpYqAtyIzJDb1bDZUUD22HGJ4+LK/n/l75C
 OSXavt4nXyI+ogadhYlQjJ15fFYhDxl0H6En2Fy4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26A8EC447A5
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 2/8] iommu: Add DOMAIN_ATTR_SPLIT_TABLES
Date: Fri, 22 Nov 2019 23:31:51 +0000
Message-ID: <0101016e95751f4e-694e42b9-6f2a-43e8-8332-ab32738320bf-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Add a new attribute to enable and query the state of split pagetables
for the domain.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index f2223cb..18c861e 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -126,6 +126,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+	DOMAIN_ATTR_SPLIT_TABLES,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
