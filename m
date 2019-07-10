Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 135F162834
	for <lists.iommu@lfdr.de>; Mon,  8 Jul 2019 20:18:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 633972A8A;
	Mon,  8 Jul 2019 18:18:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B93223D8
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 18:10:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 01F0A884
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 18:10:25 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D6F4B61132; Mon,  8 Jul 2019 18:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1562609425;
	bh=I0b5kpNA6visZ/gWW+mc9BO8uDwDyEu2oJKHrjDh8wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TIPXG+vU4zIVWPgUws+qo8sFJCJmxQCzmjtMdPdf62G9rnfZca+VhPgMXeolUVAke
	TICjx5uUZm+lLkQdUrrKlEw6fLUDyEJd2CyQCk4U8wGavaef+Rjh/M5ebK5uLLuo+p
	kh50cQI0znRp1PkZmfXZOwj5zJw9fzbugsz5Ad+s=
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
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4679B60E41;
	Mon,  8 Jul 2019 18:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1562609425;
	bh=I0b5kpNA6visZ/gWW+mc9BO8uDwDyEu2oJKHrjDh8wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TIPXG+vU4zIVWPgUws+qo8sFJCJmxQCzmjtMdPdf62G9rnfZca+VhPgMXeolUVAke
	TICjx5uUZm+lLkQdUrrKlEw6fLUDyEJd2CyQCk4U8wGavaef+Rjh/M5ebK5uLLuo+p
	kh50cQI0znRp1PkZmfXZOwj5zJw9fzbugsz5Ad+s=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4679B60E41
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] iommu: Add DOMAIN_ATTR_SPLIT_TABLES
Date: Mon,  8 Jul 2019 12:10:16 -0600
Message-Id: <1562609418-25446-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562609418-25446-1-git-send-email-jcrouse@codeaurora.org>
References: <1562609418-25446-1-git-send-email-jcrouse@codeaurora.org>
Cc: jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	dianders@chromimum.org, hoegsberg@google.com
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
index fdc355c..b06db6c 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -125,6 +125,7 @@ enum iommu_attr {
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
