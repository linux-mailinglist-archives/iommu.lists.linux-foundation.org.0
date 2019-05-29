Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFBB2D56A
	for <lists.iommu@lfdr.de>; Wed, 29 May 2019 08:19:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D71512405;
	Wed, 29 May 2019 06:19:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B47F23FE
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 06:16:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CA9527D2
	for <iommu@lists.linux-foundation.org>;
	Wed, 29 May 2019 06:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZvSD57x006kLNUpKDRV5CxeOKDz/YIRDQvZo+hMkQZw=;
	b=QBf/sgE3gnBGHrSDWCr4TZBIR
	Ys10TSVWzIEQ2ik3RCMsUB+Do+4mLrCAv3ACbdTOWV7/RzIq0OEnqa7RmDU38QCphr7O4SHZclJrV
	P9vrmoFPS0Q6nMqExtar0WsFBgrA2rewQaaydtTKF1mdU78QcLD/JBOYAU8koDaLwpcfEu7eaRaU0
	W7p/TW9u0evxIBQt2WYccVxUMQEIIg7ybcylz7N/67xjhaUxsnGlToK7dd21ar0D4DoWiLBSA9es8
	807glmgPEO99VK5awoViXCsO+0/7+YXwKmVkh+IcZQi7V6IM0FZjMqx3973e+kE2PZFvzvc5LCSai
	mZFZjofsA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hVrsw-00086V-5O; Wed, 29 May 2019 06:16:26 +0000
Date: Tue, 28 May 2019 23:16:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v4 10/15] iommu/vt-d: Probe DMA-capable ACPI name space
	devices
Message-ID: <20190529061626.GA26055@infradead.org>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
	<20190525054136.27810-11-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190525054136.27810-11-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
	David Woodhouse <dwmw2@infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Sat, May 25, 2019 at 01:41:31PM +0800, Lu Baolu wrote:
> Some platforms may support ACPI name-space enumerated devices
> that are capable of generating DMA requests. Platforms which
> support DMA remapping explicitly declares any such DMA-capable
> ACPI name-space devices in the platform through ACPI Name-space
> Device Declaration (ANDD) structure and enumerate them through
> the Device Scope of the appropriate remapping hardware unit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Isn't this something that should be handled through the IOMMU API so
that it covers other IOMMU types as well?

How does this scheme compare to the one implemented in
drivers/acpi/arm64/iort.c?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
