Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F7719BC19
	for <lists.iommu@lfdr.de>; Thu,  2 Apr 2020 08:56:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9061286138;
	Thu,  2 Apr 2020 06:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXYlfCIK-etz; Thu,  2 Apr 2020 06:56:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 360E186BC4;
	Thu,  2 Apr 2020 06:56:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 211E2C07FF;
	Thu,  2 Apr 2020 06:56:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A79D3C07FF
 for <iommu@lists.linux-foundation.org>; Thu,  2 Apr 2020 06:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9186287EC0
 for <iommu@lists.linux-foundation.org>; Thu,  2 Apr 2020 06:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtcE-WnJ22gt for <iommu@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 06:56:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 13D3387EBB
 for <iommu@lists.linux-foundation.org>; Thu,  2 Apr 2020 06:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MifLacyZ11MXEQpqNAKw1gbH0S9sMv1empiHGWRbuAk=; b=p8hZI5g2yxLDWSFmOhjHQCg3Jo
 h0+RaCI6TyhawQRO5zJaBaiX9wQgVhKe6YkQygiw7Xl+KK0bJxa4vvWf4sQ9Fz/k88IRwtSSyMbbO
 BC86cofSIwi4QDSEZ8jzM8bxqt61KY7/FIhkyYcKAFtpzz5JPvBMyqvV7ChgaOJ/LzTA88ob9zOs2
 lzwDd0+6jcd6Al+wZb4RLti0cQ7/re3n3QgWmi/prAuqc2Dg6bfTMslUobd/kFz6JXnQUcFnSSDDa
 rJZpsrLiTqnklo671iZOjx1kBFtt2VGg1c76YpTUge7FM8hUlxXb2H8pqMKjPSTKpmDhgGQDIX/u7
 wGwzayoA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jJtm7-0000Ll-7I; Thu, 02 Apr 2020 06:56:27 +0000
Date: Wed, 1 Apr 2020 23:56:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] iommu/vt-d: add NUMA awareness to intel_alloc_coherent()
Message-ID: <20200402065627.GA23242@infradead.org>
References: <1517438756.3715.108.camel@gmail.com>
 <20180202185301.GA8232@infradead.org>
 <CANn89i+FBn3fttEyU_znAd-+8BgM7VZogFeeZPA7_zubChFpBA@mail.gmail.com>
 <34c70805-44f5-6697-3ebf-2f4d56779454@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34c70805-44f5-6697-3ebf-2f4d56779454@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Benjamin Serebrin <serebrin@google.com>, netdev <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>, David Woodhouse <dwmw2@infradead.org>
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

On Wed, Apr 01, 2020 at 03:53:38PM -0700, Eric Dumazet wrote:
> 
> 
> On 2/2/18 10:59 AM, Eric Dumazet wrote:
> > On Fri, Feb 2, 2018 at 10:53 AM, Christoph Hellwig <hch@infradead.org> wrote:
> >> I've got patches pending to replace all that code with
> >> dma_direct_alloc, which will do the right thing.  They were
> >> submitted for 4.16, and I will resend them after -rc1.
> > 
> > I see, thanks Christoph !
> > 
> 
> Hi Christoph 
> 
> It seems 4.16 has shipped ( :) ) , and intel_alloc_coherent() still has no NUMA awareness.

Actually, that code went in and then got reverted again..

> Should I respin https://lore.kernel.org/patchwork/patch/884326/

Maybe.  We are still hoping to convert intel-iommu to the dma-iommu
framework, but I'm not sure how long that is going to take, so maybe
just respin it for now.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
