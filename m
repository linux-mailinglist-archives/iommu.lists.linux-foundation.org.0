Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9EC11494F
	for <lists.iommu@lfdr.de>; Thu,  5 Dec 2019 23:30:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 50E6588B41;
	Thu,  5 Dec 2019 22:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9Sp8zFYGSpO; Thu,  5 Dec 2019 22:30:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B406288B38;
	Thu,  5 Dec 2019 22:30:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4623C077D;
	Thu,  5 Dec 2019 22:30:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C548BC077D
 for <iommu@lists.linux-foundation.org>; Thu,  5 Dec 2019 22:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B784388AEE
 for <iommu@lists.linux-foundation.org>; Thu,  5 Dec 2019 22:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4ss4PPfzqIL for <iommu@lists.linux-foundation.org>;
 Thu,  5 Dec 2019 22:30:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6F6BE88AC5
 for <iommu@lists.linux-foundation.org>; Thu,  5 Dec 2019 22:30:47 +0000 (UTC)
Received: from localhost (mobile-166-170-221-197.mycingular.net
 [166.170.221.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84F6520707;
 Thu,  5 Dec 2019 22:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575585047;
 bh=rwc2W/J/V58JZoKOWg2doRruK6KWPbQgM5Sb2F/Ai60=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=cliOZcUxDWzGZ1UQTKJkPsD++s/EPrjyE7H/snJuA3uqE7NURH520sOnVje6nd0Ts
 Td38CmfeZyMBlRyr+Rypsepv/EG8hoAOa7B7sJiJzOVgMDkiBquX3yxdZnHzKOkS/c
 BBv+wew7DxEj2QDNBsIebdp/nYnu0CS5l8OPwMaM=
Date: Thu, 5 Dec 2019 16:30:44 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v4 7/8] linux/log2.h: Fix 64bit calculations in
 roundup/down_pow_two()
Message-ID: <20191205223044.GA250573@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203114743.1294-8-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-pci@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-nfs@vger.kernel.org,
 Edward Cree <ecree@solarflare.com>, linux-clk@vger.kernel.org,
 f.fainelli@gmail.com, Herbert Xu <herbert@gondor.apana.org.au>,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, maz@kernel.org,
 phil@raspberrypi.org, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Chen-Yu Tsai <wens@csie.org>,
 Chuck Lever <chuck.lever@oracle.com>, Martin Habets <mhabets@solarflare.com>,
 wahrenst@gmx.net, Tom Lendacky <thomas.lendacky@amd.com>,
 Jiri Pirko <jiri@resnulli.us>,
 Solarflare linux maintainers <linux-net-drivers@solarflare.com>,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, Mirko Lindner <mlindner@marvell.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>, mbrugger@suse.com,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Yishai Hadas <yishaih@mellanox.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 "David S. Miller" <davem@davemloft.net>,
 Stephen Hemminger <stephen@networkplumber.org>, linux-rdma@vger.kernel.org,
 iommu@lists.linux-foundation.org, Moni Shoua <monis@mellanox.com>,
 Eric Biederman <ebiederm@xmission.com>, james.quinlan@broadcom.com,
 Thomas Graf <tgraf@suug.ch>, Robin Murphy <robin.murphy@arm.con>,
 David Woodhouse <dwmw2@infradead.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
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

You got the "n" on "down" in the subject, but still missing "of" ;)

On Tue, Dec 03, 2019 at 12:47:40PM +0100, Nicolas Saenz Julienne wrote:
> Some users need to make sure their rounding function accepts and returns
> 64bit long variables regardless of the architecture. Sadly
> roundup/rounddown_pow_two() takes and returns unsigned longs. It turns
> out ilog2() already handles 32/64bit calculations properly, and being
> the building block to the round functions we can rework them as a
> wrapper around it.

Missing "of" in the function names here.
s/a wrapper/wrappers/

IIUC the point of this is that roundup_pow_of_two() returned
"unsigned long", which can be either 32 or 64 bits (worth pointing
out, I think), and many callers need something that returns
"unsigned long long" (always 64 bits).

It's a nice simplification to remove the "__" variants.  Just as a
casual reader of this commit message, I'd like to know why we had both
the roundup and the __roundup versions in the first place, and why we
no longer need both.

> -#define roundup_pow_of_two(n)			\
> -(						\
> -	__builtin_constant_p(n) ? (		\
> -		(n == 1) ? 1 :			\
> -		(1UL << (ilog2((n) - 1) + 1))	\
> -				   ) :		\
> -	__roundup_pow_of_two(n)			\
> - )
> +#define roundup_pow_of_two(n)			  \
> +(						  \
> +	(__builtin_constant_p(n) && ((n) == 1)) ? \
> +	1 : (1ULL << (ilog2((n) - 1) + 1))        \
> +)

Should the resulting type of this expression always be a ULL, even
when n==1, i.e., should it be this?

  1ULL : (1ULL << (ilog2((n) - 1) + 1))        \

Or maybe there's no case where that makes a difference?

Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
