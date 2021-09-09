Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E6D404804
	for <lists.iommu@lfdr.de>; Thu,  9 Sep 2021 11:48:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB68660AE2;
	Thu,  9 Sep 2021 09:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFYhDUkAUMjk; Thu,  9 Sep 2021 09:48:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E133460ACD;
	Thu,  9 Sep 2021 09:48:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C014DC000D;
	Thu,  9 Sep 2021 09:48:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5B12C000D
 for <iommu@lists.linux-foundation.org>; Thu,  9 Sep 2021 09:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FB56849B4
 for <iommu@lists.linux-foundation.org>; Thu,  9 Sep 2021 09:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-BR-guL5xpZ for <iommu@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:48:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A89D9849B2
 for <iommu@lists.linux-foundation.org>; Thu,  9 Sep 2021 09:48:40 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E116560F; Thu,  9 Sep 2021 11:48:34 +0200 (CEST)
Date: Thu, 9 Sep 2021 11:48:17 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] iommu: Clarify default domain Kconfig
Message-ID: <YTnYYd+DWwpKAfEf@8bytes.org>
References: <69a0c6f17b000b54b8333ee42b3124c1d5a869e2.1631105737.git.robin.murphy@arm.com>
 <CAHk-=whm5tP-JDnZ=LCr2ZpnPaAZakZyN=wD_tY7pydQJRtJXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whm5tP-JDnZ=LCr2ZpnPaAZakZyN=wD_tY7pydQJRtJXw@mail.gmail.com>
Cc: Will Deacon <will@kernel.org>, iommu <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Wed, Sep 08, 2021 at 09:47:03AM -0700, Linus Torvalds wrote:
> I'm assuming I'll get it through the iommu tree eventually (no need to
> expedite this)

Yes, I just applied it along with a couple of other fixes to the iommu
tree and will send a pull-request tomorrow.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
