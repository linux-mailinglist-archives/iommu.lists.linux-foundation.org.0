Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ADF31AA9E
	for <lists.iommu@lfdr.de>; Sat, 13 Feb 2021 10:19:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD1A76F715
	for <lists.iommu@lfdr.de>; Sat, 13 Feb 2021 09:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id diBaEhYyujfO for <lists.iommu@lfdr.de>;
	Sat, 13 Feb 2021 09:19:43 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 7A0C06F7B8; Sat, 13 Feb 2021 09:19:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5022F6F4F1;
	Sat, 13 Feb 2021 09:19:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 291E2C1834;
	Sat, 13 Feb 2021 09:19:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69D83C013A
 for <iommu@lists.linux-foundation.org>; Sat, 13 Feb 2021 09:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 392C96F6C7
 for <iommu@lists.linux-foundation.org>; Sat, 13 Feb 2021 09:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9y7enxxTy5E8 for <iommu@lists.linux-foundation.org>;
 Sat, 13 Feb 2021 09:19:38 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 6636B6F713; Sat, 13 Feb 2021 09:19:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1D526F6C7
 for <iommu@lists.linux-foundation.org>; Sat, 13 Feb 2021 09:19:36 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lAr4j-0003E3-03; Sat, 13 Feb 2021 10:18:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 8C3A4C0344; Sat, 13 Feb 2021 10:06:59 +0100 (CET)
Date: Sat, 13 Feb 2021 10:06:59 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: MIPS noncoherent DMA cleanups v2
Message-ID: <20210213090659.GD4330@alpha.franken.de>
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

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
