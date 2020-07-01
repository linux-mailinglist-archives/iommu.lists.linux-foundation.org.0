Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B12210C59
	for <lists.iommu@lfdr.de>; Wed,  1 Jul 2020 15:35:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AEB822692A;
	Wed,  1 Jul 2020 13:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYflB60JNEtr; Wed,  1 Jul 2020 13:35:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2A58C26604;
	Wed,  1 Jul 2020 13:35:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EC9EC0733;
	Wed,  1 Jul 2020 13:35:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36260C0733;
 Wed,  1 Jul 2020 13:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 247C126604;
 Wed,  1 Jul 2020 13:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9zOffZ2jDkg; Wed,  1 Jul 2020 13:35:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id D9EDA26509;
 Wed,  1 Jul 2020 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6o0bqYA9UibQkqr/MmLZIfw1Phn9yQ8zQ1ln3u9Cm/E=; b=hlKDnjFXs/Y5WjrWNNgSQ+2Cvd
 RvsmfMbhXkV1KC+OK+5x7CGESEtA1Qk4HZeAu6Yaz/UH9zEAUbNa9FVjAhV4Duiv/yAyXRv3/1ni3
 CSmwa08RJtybgECUGXsj6t5Ikz9WU8jXnEjZhSsiO4Cce5bMLn+ryrsvUEQAfHt3Y/kj2M4b29Xj0
 2lORXLltD3a0Za4R4fVC/+lv0bptUhSUEHkFmEDfSV3phIa7QD/g3Q2Zle+t27uSL2Zcfg1ARrlES
 xPbJ0Leq9BQuYJ3vQmrkn81G/oqYWCgAUIa51MwnCk73e/oMjUpHEK7/k+Ajj3vJC3XBgczD+ReMg
 1fAQgQbQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jqct6-0006Qi-2K; Wed, 01 Jul 2020 13:34:56 +0000
Date: Wed, 1 Jul 2020 14:34:56 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200701133456.GA23888@infradead.org>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, x86@kernel.org,
 konrad.wilk@oracle.com, jasowang@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, Jun 29, 2020 at 04:46:09PM -0700, Stefano Stabellini wrote:
> > I could imagine some future Xen hosts setting a flag somewhere in the
> > platform capability saying "no xen specific flag, rely on
> > "VIRTIO_F_ACCESS_PLATFORM". Then you set that accordingly in QEMU.
> > How about that?
> 
> Yes, that would be fine and there is no problem implementing something
> like that when we get virtio support in Xen. Today there are still no
> virtio interfaces provided by Xen to ARM guests (no virtio-block/net,
> etc.)
> 
> In fact, in both cases we are discussing virtio is *not* provided by
> Xen; it is a firmware interface to something entirely different:
> 
> 1) virtio is used to talk to a remote AMP processor (RPMesg)
> 2) virtio is used to talk to a secure-world firmware/OS (Trusty)
>
> VIRTIO_F_ACCESS_PLATFORM is not set by Xen in these cases but by RPMesg
> and by Trusty respectively. I don't know if Trusty should or should not
> set VIRTIO_F_ACCESS_PLATFORM, but I think Linux should still work
> without issues.
> 

Any virtio implementation that is not in control of the memory map
(aka not the hypervisor) absolutely must set VIRTIO_F_ACCESS_PLATFORM,
else it is completely broken.

> The xen_domain() check in Linux makes it so that vring_use_dma_api
> returns the opposite value on native Linux compared to Linux as Xen/ARM
> DomU by "accident". By "accident" because there is no architectural
> reason why Linux Xen/ARM DomU should behave differently compared to
> native Linux in this regard.
> 
> I hope that now it is clearer why I think the if (xen_domain()) check
> needs to be improved anyway, even if we fix generic dma_ops with virtio
> interfaces missing VIRTIO_F_ACCESS_PLATFORM.

IMHO that Xen quirk should never have been added in this form..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
