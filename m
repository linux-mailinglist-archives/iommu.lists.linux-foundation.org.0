Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 070C9316431
	for <lists.iommu@lfdr.de>; Wed, 10 Feb 2021 11:47:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AAA7E866F3;
	Wed, 10 Feb 2021 10:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hgTi5sz-nmT; Wed, 10 Feb 2021 10:47:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C2CA86734;
	Wed, 10 Feb 2021 10:47:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21816C013A;
	Wed, 10 Feb 2021 10:47:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A4F3C013A
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 10:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 07D16861B2
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 10:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUs2lYlCaRfc for <iommu@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 10:47:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7539485FA2
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 10:47:28 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1l9n1q-00079N-00; Wed, 10 Feb 2021 11:47:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 4361AC0E24; Wed, 10 Feb 2021 11:46:51 +0100 (CET)
Date: Wed, 10 Feb 2021 11:46:51 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: MIPS noncoherent DMA cleanups v2
Message-ID: <20210210104651.GA11540@alpha.franken.de>
References: <20210210095641.23856-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210095641.23856-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
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

On Wed, Feb 10, 2021 at 10:56:35AM +0100, Christoph Hellwig wrote:
> Hi Thomas,
> 
> this series cleans up some of the mips (maybe) noncoherent support.
> It also remove the need for the special <asm/dma-coherence.h> header only
> provided by mips.
> 
> Changes since v1:
>  - fix a bisection issue due to a missing brace
>  - simplify the parameter parsing given that it happens after
>    plat_mem_init

LGTM and passed all tests I did so far. I'll give it a few days for
others to look at and apply it to mips-next for 5.12.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
