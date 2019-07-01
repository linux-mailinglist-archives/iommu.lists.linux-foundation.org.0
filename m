Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8CB2E6D9
	for <lists.iommu@lfdr.de>; Wed, 29 May 2019 23:00:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8EEC52A90;
	Wed, 29 May 2019 20:59:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 794182A6B
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 20:55:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 43FBB821
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 20:55:11 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 18A9A60CF0; Wed, 29 May 2019 20:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1559163311;
	bh=ao1igd18u0fKnkzgWlolVx+hvnaOxQo8OJMI9HBKlt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kl4szSOoZ5dqa3mMbh05LRo5qH2H6ITrH6hEJ/RJatL+VQBYCnuHHB3cI+qEX4lqK
	UiP7UH4DNR1QmDKdhZfqRjezeaQBprWD7G9vvk3meWZDJyao9Q+MwODJ7156BWXxG2
	0KYpxRbAPynjUZrRwVY40KiJlxmLEzQnZWPWrRIw=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: jcrouse@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B02F60E5C;
	Wed, 29 May 2019 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1559163310;
	bh=ao1igd18u0fKnkzgWlolVx+hvnaOxQo8OJMI9HBKlt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jlh8ZatgBdfUYzda6tEzyZqE8+ObhJJCrv0D3nqtlgo6/sgkZW4Y/P6mRepiAKDZC
	GDTsegKrIFttDfIugupT/2G5HHqnszcofccBhEt3zho2wBIoJ6GqXXsubRwurDHE6N
	GmImIVqA3uSa5iJGNrbOYBOLC+gFIlGLVE35TzVs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B02F60E5C
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 02/16] iommu: Add DOMAIN_ATTR_SPLIT_TABLES
Date: Wed, 29 May 2019 14:54:38 -0600
Message-Id: <1559163292-4792-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
Cc: jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
	dianders@chromium.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, hoegsberg@google.com
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

Add a new domain attribute to enable split pagetable support for devices
devices that support it.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index a815cf6..a2f07cf 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -128,6 +128,7 @@ enum iommu_attr {
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
