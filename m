Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9037F1A5D31
	for <lists.iommu@lfdr.de>; Sun, 12 Apr 2020 09:35:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4E852859EF;
	Sun, 12 Apr 2020 07:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZSOsVc_Et4A; Sun, 12 Apr 2020 07:35:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 777C0859D1;
	Sun, 12 Apr 2020 07:35:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61AD7C0177;
	Sun, 12 Apr 2020 07:35:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 935AEC0177
 for <iommu@lists.linux-foundation.org>; Sun, 12 Apr 2020 07:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8AABC87627
 for <iommu@lists.linux-foundation.org>; Sun, 12 Apr 2020 07:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Mf3SoMBwGpS for <iommu@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 07:35:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 523558759E
 for <iommu@lists.linux-foundation.org>; Sun, 12 Apr 2020 07:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ScwCZOvLyFziUiTE/s7lRo5HTwcGZHzgW4gqUCQQOG8=; b=PQNuB55FuOufIMCAs4l9mm4Pvl
 S39LPeZmPYgk9QUS9N6fe86vpkL6cVTqOlL0YxrW5Y6YqG9ZBnRxdkUpfXHRIRKbaEKPgaa+gU+FW
 oQgOHguDt5aMYpvsNP2RAOU9Y7E5r0LTejc6Lr1yoQm4Jf+LUvuW3Gyb1SI4Yseu6nD3b7X2NOmUt
 41uMp06oHzCWbd0XYIFVP6aW32sl7LbpnWIY+4pFVlWgkyqfTbCey1pSGbaojkiKC/ymwtFINeJdS
 xw1lDAKFFi8fT5n2NdiMIVLHsvfwxk9HyA14BDDB43+6SreqF8mTPnYM3gk1nV5D/Dee3YeS3Y9hC
 Ykeaoddw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jNX9N-0000Km-Ah; Sun, 12 Apr 2020 07:35:29 +0000
Date: Sun, 12 Apr 2020 00:35:29 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: use DMA domain for real DMA devices and
 subdevices
Message-ID: <20200412073529.GA13784@infradead.org>
References: <20200409191736.6233-1-jonathan.derrick@intel.com>
 <20200409191736.6233-2-jonathan.derrick@intel.com>
 <CAD8Lp442LO1Sq5xpKOaRUKLsEyGbou4TiHQrDdnMbCOV-TG0+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD8Lp442LO1Sq5xpKOaRUKLsEyGbou4TiHQrDdnMbCOV-TG0+g@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Linux PCI <linux-pci@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 Linux Upstreaming Team <linux@endlessm.com>,
 Jon Derrick <jonathan.derrick@intel.com>
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

On Sun, Apr 12, 2020 at 11:50:09AM +0800, Daniel Drake wrote:
> > different addressing capabilities and some require translation. Instead we can
> > put the real DMA dev and any subdevices on the DMA domain. This change assigns
> > subdevices to the DMA domain, and moves the real DMA device to the DMA domain
> > if necessary.
> 
> Have you tested this with the real DMA device in identity mode?
> It is not quite working for me. (Again, I'm not using VMD here, but
> have looked closely and believe we're working under the same
> constraints)

So if you are not using VMD how does this matter for upstream?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
