Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9ED25538
	for <lists.iommu@lfdr.de>; Tue, 21 May 2019 18:14:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6BE73C51;
	Tue, 21 May 2019 16:14:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8A944C51
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 16:14:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 993F327B
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 16:14:36 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 48A1661A32; Tue, 21 May 2019 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1558455276;
	bh=3x0zc3WxCeO54aoJuwmbDxEraXdWNxdZfplRLlNxmIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=COi9Lo1y1zyN9TymmysoEBZlwb7BeTwfef6eF8UHEzqD+L1aRsUpNJX7kvtVk+RR+
	OioqGDfOBIa/KrESaVYCdMGmdKEIbByIX2uWKTJFQRoio3iyleR5gPwqIGKY82YidE
	d7OZ9RTPIpFWLUjT91J5Y5QwxONQtFJ7S3v4/Hcw=
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
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E0AB06118D;
	Tue, 21 May 2019 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1558455255;
	bh=3x0zc3WxCeO54aoJuwmbDxEraXdWNxdZfplRLlNxmIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YBu+P3VVUo2YGJ1LgV4StfL0acSXyC2goopPHgncZ66a00FIYX5t1f/vAmW0x3tTV
	ereZtP5GPm3Zb1sC5ZW5Pck5HR++4oRqOJtxyb6b7MY0Bl47b/OMo25iRriFktc7Nu
	5BYP7Lct1hpcDS4JJcl3+3bDMBXJ9ycfkKTqQusk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E0AB06118D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 04/15] iommu: Add DOMAIN_ATTR_PTBASE
Date: Tue, 21 May 2019 10:13:52 -0600
Message-Id: <1558455243-32746-5-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
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

Add an attribute to return the base address of the pagetable. This is used
by auxiliary domains from arm-smmu to return the address of the pagetable
to the leaf driver so that it can set the appropriate pagetable through
it's own means.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 204acd8..2252edc 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -129,6 +129,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
 	DOMAIN_ATTR_SPLIT_TABLES,
+	DOMAIN_ATTR_PTBASE,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
