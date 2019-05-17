Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D08F21E09
	for <lists.iommu@lfdr.de>; Fri, 17 May 2019 21:06:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9D3ABCA6;
	Fri, 17 May 2019 19:05:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BA143AB9
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 18:48:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7107C5E4
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 18:48:29 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 36A1A6192D; Fri, 17 May 2019 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1558118909;
	bh=P/hWDoOqVaRAA//LwTH4zMFxt0mPSjrmyOPmLTB6goc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wk2Z8fzwphZ75dgUXY2CHpEWyyZsHo8h1prH6M2hO85HZN4XHyA5h4Dvskzs32vWs
	W4HzCCMwjxkDGg9JxUw5dAeDxKk7F/R6TYdykTMgeNM5dorPkLmfWfsDAwg0uiWUcs
	ryrhGodqT3DNl8kRY1wsADa6T24zLaL0mjO7tpvU=
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
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D048618EF;
	Fri, 17 May 2019 18:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1558118901;
	bh=P/hWDoOqVaRAA//LwTH4zMFxt0mPSjrmyOPmLTB6goc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QfpDLnxeIPU6NUIdpUd/TjJOc/ag7MqQuKJcyux/eHC9sh5ZQi5AzegZRawPdGYu3
	HfEfHMlFkdkx8diUL2rUMcZDn1zSdN2eYynIbfgQJhNC3fbo3o0uXw2qTMpTaBxMaD
	iJ/XKPEcjJnh0B6mm4gAH9V965/21KEPbCCkhHsA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D048618EF
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC/PATCH 2/4] PCI: Export PCI ACS and DMA searching functions to
	modules
Date: Fri, 17 May 2019 11:47:35 -0700
Message-Id: <1558118857-16912-3-git-send-email-isaacm@codeaurora.org>
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

IOMMU drivers that can be compiled as modules may
want to use pci_for_each_dma_alias() and pci_request_acs(),
so export those functions.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/pci/pci.c    | 1 +
 drivers/pci/search.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 766f577..3f354c1 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3124,6 +3124,7 @@ void pci_request_acs(void)
 {
 	pci_acs_enable = 1;
 }
+EXPORT_SYMBOL_GPL(pci_request_acs);
 
 static const char *disable_acs_redir_param;
 
diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index 2b5f720..cf9ede9 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -111,6 +111,7 @@ int pci_for_each_dma_alias(struct pci_dev *pdev,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pci_for_each_dma_alias);
 
 static struct pci_bus *pci_do_find_bus(struct pci_bus *bus, unsigned char busnr)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
