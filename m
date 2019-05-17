Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF8421E07
	for <lists.iommu@lfdr.de>; Fri, 17 May 2019 21:05:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2BCAEC96;
	Fri, 17 May 2019 19:05:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 100CFAA5
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 18:48:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BDF19710
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 18:48:22 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 6938761156; Fri, 17 May 2019 18:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1558118902;
	bh=szynDbiQZiC2P3ZZa2ZE5dH0th3Xmp6lVJejuhOsIns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kotxC/gVpeWN8ZXVIuWXQt/mHqfwd/yP0BNPfZEaquVsSOQcuiuh5SaTEsjs5L7Th
	GIJYJH/bOTHC0pxhLcenw/yZ32dbBwofroI+CBiafdzlRB04jWrcc/VCLkLuFl6v5a
	nNgx+VzhpuwbvZAOb0xvdwHuwZMHJ+Kk9NES1eyY=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: isaacm@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6534E618EA;
	Fri, 17 May 2019 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1558118898;
	bh=szynDbiQZiC2P3ZZa2ZE5dH0th3Xmp6lVJejuhOsIns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OWCRqzldpIG0aetEHRflxj1Jken3IgDr27PBGDkFBQJ2CVV5W+gIFaPRV8NhSrr0K
	MSlxvDKDo5FtdvUKPoj5MU2LPuphGmSw+PEg6rWhfnt8kpf8AWyJ3oxf9RJH87zlgl
	yV5F8UY1eS6J8DlofloLUzyyZkt9Ai2AuA2SZ7iY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6534E618EA
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC/PATCH 1/4] of: Export of_phandle_iterator_args() to modules
Date: Fri, 17 May 2019 11:47:34 -0700
Message-Id: <1558118857-16912-2-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558118857-16912-1-git-send-email-isaacm@codeaurora.org>
References: <1558118857-16912-1-git-send-email-isaacm@codeaurora.org>
X-Mailman-Approved-At: Fri, 17 May 2019 19:05:24 +0000
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, kernel-team@android.com,
	robin.murphy@arm.com, will.deacon@arm.com, lmark@codeaurora.org,
	robh+dt@kernel.org, bhelgaas@google.com, frowand.list@gmail.com,
	pratikp@codeaurora.org
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

Kernel modules may want to use of_phandle_iterator_args(),
so export it.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 20e0e7e..8b9c597 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1388,6 +1388,7 @@ int of_phandle_iterator_args(struct of_phandle_iterator *it,
 
 	return count;
 }
+EXPORT_SYMBOL_GPL(of_phandle_iterator_args);
 
 static int __of_parse_phandle_with_args(const struct device_node *np,
 					const char *list_name,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
