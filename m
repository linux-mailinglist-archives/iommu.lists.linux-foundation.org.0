Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1EE13278E
	for <lists.iommu@lfdr.de>; Tue,  7 Jan 2020 14:28:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A0A28750A;
	Tue,  7 Jan 2020 13:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IlMEQoaxZDDz; Tue,  7 Jan 2020 13:28:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C0A0687482;
	Tue,  7 Jan 2020 13:28:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97FF0C0881;
	Tue,  7 Jan 2020 13:28:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B508C0881
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 13:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8944320362
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 13:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqxBzeWLrily for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 13:27:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id E8F692034C
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZgcWgVZWoALXHLMfZ5dpmFvCO8GJAsNY0kanZ31E1kw=; b=dIul6ScW9Fbch0ICIUvuHBOO1
 zVBnim7uI5MjoOdSJO936XOCLdQgnx6NXaMEZkeTPb8hGZvTbIO2dkoFmZWrrRQn3O17XLgd3ELpS
 l/28oBCKWRckv4yyId6YsIM0orB3rMVQwzbzzvtePESxtDJeAepuDnU0jEGF408b1dLC5M6IwsEqX
 oCpNNMguL9raxbAHfizNieQTLLKl2m0uUgWN8mKVUDT/oserZeMCcVTNshRJAV+snKsjaoSsnjGZV
 uZQWF8D4aOSRAwDZX7xe5WauZ8LR/K4ahd07ohuW2xqaBp3JftAx7w/x7/WNe0PO/BCILWTMWC/ij
 tYkheqReg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iootj-0001Xd-88; Tue, 07 Jan 2020 13:27:51 +0000
Date: Tue, 7 Jan 2020 05:27:51 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Add a quirk flag for scope mismatched
 devices
Message-ID: <20200107132751.GA584@infradead.org>
References: <20191224062240.4796-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224062240.4796-1-baolu.lu@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Roland Dreier <roland@purestorage.com>, Jim Yan <jimyan@baidu.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

WTF is a NVMe host supposed to mean for a PCIe device.  NVMe defines
the host as following:

"1.6.16 host

An entity that interfaces to an NVM subsystem through one or more
controllers and submits commands to Submission Queues and retrieves
command completions from Completion Queues."

in other words - the Linux kernel is the NVMe host.  You need to
describe this magic broken piece of crap a lot better than that.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
