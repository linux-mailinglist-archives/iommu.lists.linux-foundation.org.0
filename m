Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EA1175F3F
	for <lists.iommu@lfdr.de>; Mon,  2 Mar 2020 17:11:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D5FD876F4;
	Mon,  2 Mar 2020 16:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GrGRjCZ-6CR1; Mon,  2 Mar 2020 16:11:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 861AD87774;
	Mon,  2 Mar 2020 16:11:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E6DCC013E;
	Mon,  2 Mar 2020 16:11:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D642C013E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 16:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9A0C986061
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 16:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfDhRaWmDY5G for <iommu@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 16:11:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B521F8573E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 16:11:28 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C928D5BC; Mon,  2 Mar 2020 17:11:26 +0100 (CET)
Date: Mon, 2 Mar 2020 17:11:23 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Fix IOVA validation for 32-bit
Message-ID: <20200302161123.GC7829@8bytes.org>
References: <dd330453ed31099b5b3b76db02fe79d55aa9bce3.1582899080.git.robin.murphy@arm.com>
 <20200302115300.GA9233@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302115300.GA9233@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
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

On Mon, Mar 02, 2020 at 11:53:01AM +0000, Will Deacon wrote:
> On Fri, Feb 28, 2020 at 02:18:55PM +0000, Robin Murphy wrote:
> > Since we ony support the TTB1 quirk for AArch64 contexts, and
> > consequently only for 64-bit builds, the sign-extension aspect of the
> > "are all bits above IAS consistent?" check should implicitly only apply
> > to 64-bit IOVAs. Change the type of the cast to ensure that 32-bit longs
> > don't inadvertently get sign-extended, and thus considered invalid, if
> > they happen to be above 2GB in the TTB0 region.
> > 
> > Reported-by: Stephan Gerhold <stephan@gerhold.net>
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > 
> > ---
> > 
> > Logically there may also have been a UBSAN "shift greater than size of
> > type" warning too, but arch/arm doesn't support UBSAN_SANITIZE_ALL,
> > and that's now my only easy "spin up a 32-bit VM" option to hand :)
> > 
> >  drivers/iommu/io-pgtable-arm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Joerg -- pleae can you take this as a fix for 5.6?

Done, do you also have a fixes-tag for me?

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
