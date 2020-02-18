Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D9162D02
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 18:33:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 20A6C861E7;
	Tue, 18 Feb 2020 17:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZZOP9n+UC6s; Tue, 18 Feb 2020 17:33:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 351F0860A2;
	Tue, 18 Feb 2020 17:33:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22344C013E;
	Tue, 18 Feb 2020 17:33:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9822C013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 953D586113
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6beHQf-Fn0l8 for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 17:33:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DEC6382476
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:33:42 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0C1F0014C3F76BBACA8B76.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:1f00:14c3:f76b:baca:8b76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 97C341EC0CE8;
 Tue, 18 Feb 2020 18:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1582047219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=RQeBvXI621OpNJABJKZKVWpEMPbJNSTe+fCxB2Fm/Vo=;
 b=NVQltzJcnErUiTBnCebDnivFmAdUN1V2AohuWTMn272uhHsVO5AZK/O6ZHJRkwej6+Pjtj
 lcIebZUtEpSiNP6fNloDnVP8/5nrBYHAr+mmwFcbARu9bY65pbsJKv6ZG0jSJDQJnQOq9J
 qrcXwykORCUc99KOOqWRygFDieMasww=
Date: Tue, 18 Feb 2020 18:33:40 +0100
From: Borislav Petkov <bp@alien8.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 05/11] EDAC: Remove Calxeda drivers
Message-ID: <20200218173339.GL14449@zn.tnic>
References: <20200218171321.30990-1-robh@kernel.org>
 <20200218171321.30990-6-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218171321.30990-6-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Langsdorf <mlangsdo@redhat.com>, kvm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-ide@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org, soc@kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 Jon Loeliger <jdl@jdl.com>, linux-pm@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Tony Luck <tony.luck@intel.com>,
 Alexander Graf <graf@amazon.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Matthias Brugger <mbrugger@suse.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Robert Richter <rrichter@marvell.com>, James Morse <james.morse@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
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

On Tue, Feb 18, 2020 at 11:13:15AM -0600, Rob Herring wrote:
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Robert Richter <rrichter@marvell.com>
> Cc: linux-edac@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Do not apply yet.
> 
>  MAINTAINERS                     |   6 -
>  drivers/edac/Kconfig            |  14 --
>  drivers/edac/Makefile           |   3 -
>  drivers/edac/highbank_l2_edac.c | 142 -----------------
>  drivers/edac/highbank_mc_edac.c | 272 --------------------------------
>  5 files changed, 437 deletions(-)
>  delete mode 100644 drivers/edac/highbank_l2_edac.c
>  delete mode 100644 drivers/edac/highbank_mc_edac.c

I'd obviously take patches like that any time of the week so lemme know
when... :-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
