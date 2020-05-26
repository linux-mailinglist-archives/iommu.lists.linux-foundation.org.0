Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 204981E246B
	for <lists.iommu@lfdr.de>; Tue, 26 May 2020 16:47:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D1F1D2287D;
	Tue, 26 May 2020 14:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUp9bt0yYEBZ; Tue, 26 May 2020 14:47:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CF82E231A8;
	Tue, 26 May 2020 14:47:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6FF7C016F;
	Tue, 26 May 2020 14:47:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE7D0C016F
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 14:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B991187C69
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 14:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U+CnxnjigXTa for <iommu@lists.linux-foundation.org>;
 Tue, 26 May 2020 14:47:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 44E2F87B21
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0Lm8kIZucM9N101SLlLcwGvyzcwDFh9rh0/kpGAsWR8=; b=iFU/FK7WgcwuU1nzH+IvLCDEOD
 YW7VLT4NCbBO4cOYoghFHPWsHEwrpF4u0zer832+q3IxpnxJl8WDMI88a5n0shvG+FnLOoglo6l7m
 nBwOdx29rjE2SXhYw9An4k+rTcd3zEWAbd4T3H/2czviIm9e1FgwaCa4ecfsOuFylZmMf66QNPWs+
 6mzmPJOUafuLVb3g45f1LeBEz6HRq9V37zOT3LER8/BKQPtI/WSburZIopEnE2UKazsrtlu2QzVH1
 Pd3yDpx5Z4HpRq6oYD/qL7uamCmt81uIRkA46myiz5qRqe1u7cgEMkkmlUNal1fWdOAApqtTrftfn
 UyN0pNcQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jdaqq-0005YE-Ty; Tue, 26 May 2020 14:46:44 +0000
Date: Tue, 26 May 2020 07:46:44 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: Re: [PATCH 1/2] PCI: Introduce PCI_FIXUP_IOMMU
Message-ID: <20200526144644.GA20784@infradead.org>
References: <1590493749-13823-1-git-send-email-zhangfei.gao@linaro.org>
 <1590493749-13823-2-git-send-email-zhangfei.gao@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590493749-13823-2-git-send-email-zhangfei.gao@linaro.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jean-philippe <jean-philippe@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 linux-pci@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hanjun Guo <guohanjun@huawei.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 kenneth-lee-2012@foxmail.com, linux-arm-kernel@lists.infradead.org,
 Len Brown <lenb@kernel.org>
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

On Tue, May 26, 2020 at 07:49:08PM +0800, Zhangfei Gao wrote:
> Some platform devices appear as PCI but are actually on the AMBA bus,
> and they need fixup in drivers/pci/quirks.c handling iommu_fwnode.
> Here introducing PCI_FIXUP_IOMMU, which is called after iommu_fwnode
> is allocated, instead of reusing PCI_FIXUP_FINAL since it will slow
> down iommu probing as all devices in fixup final list will be
> reprocessed.

Who is going to use this?  I don't see a single user in the series.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
