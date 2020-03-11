Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7D181C89
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 16:43:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13E8586B77;
	Wed, 11 Mar 2020 15:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgyRdRtHgEx8; Wed, 11 Mar 2020 15:43:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A85BA86AFD;
	Wed, 11 Mar 2020 15:43:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 992E0C0177;
	Wed, 11 Mar 2020 15:43:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03F03C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 15:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F18E386B77
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 15:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_fAkuv32Uv3 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:43:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DA39C86AFD
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 15:43:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5515F68B05; Wed, 11 Mar 2020 16:43:28 +0100 (CET)
Date: Wed, 11 Mar 2020 16:43:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Artem S. Tashkinov" <aros@gmx.com>
Subject: Re: [Bug 206175] Fedora >= 5.4 kernels instantly freeze on boot
 without producing any display output
Message-ID: <20200311154328.GA24044@lst.de>
References: <bug-206175-5873@https.bugzilla.kernel.org/>
 <bug-206175-5873-S6PaNNClEr@https.bugzilla.kernel.org/>
 <CAHk-=wi4GS05j67V0D_cRXRQ=_Jh-NT0OuNpF-JFsDFj7jZK9A@mail.gmail.com>
 <20200310162342.GA4483@lst.de>
 <CAHk-=wgB2YMM6kw8W0wq=7efxsRERL14OHMOLU=Nd1OaR+sXvw@mail.gmail.com>
 <20200310182546.GA9268@lst.de> <20200311152453.GB23704@lst.de>
 <e70dd793-e8b8-ab0c-6027-6c22b5a99bfc@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e70dd793-e8b8-ab0c-6027-6c22b5a99bfc@gmx.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
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

On Wed, Mar 11, 2020 at 03:34:38PM +0000, Artem S. Tashkinov wrote:
> On 3/11/20 3:24 PM, Christoph Hellwig wrote:
>> pdev->dma_mask = parent->dma_mask ? *parent->dma_mask : 0;
>
> This patch makes no difference.
>
> The kernel panics with the same call trace which starts with:

This looks really strange and not dma mask related, but there must be
some odd interactions somewhere.

Can you call gdb on the vmlinux file for the 5.5.8-200.fc31 kernel
in the jpg and then do

l *(kmem_cache_alloc_trace+0x7e)

l *(acpi_processor_add+0x3a)

and send the output?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
