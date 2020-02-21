Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AEF1689DB
	for <lists.iommu@lfdr.de>; Fri, 21 Feb 2020 23:14:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C979088187;
	Fri, 21 Feb 2020 22:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fqH64t5s4mSb; Fri, 21 Feb 2020 22:14:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE1208817F;
	Fri, 21 Feb 2020 22:14:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B265DC013E;
	Fri, 21 Feb 2020 22:14:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49E51C013E
 for <iommu@lists.linux-foundation.org>; Fri, 21 Feb 2020 22:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 324548214C
 for <iommu@lists.linux-foundation.org>; Fri, 21 Feb 2020 22:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfjvz4-2lp7C for <iommu@lists.linux-foundation.org>;
 Fri, 21 Feb 2020 22:14:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 971F982125
 for <iommu@lists.linux-foundation.org>; Fri, 21 Feb 2020 22:14:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s1so1975065pfh.10
 for <iommu@lists.linux-foundation.org>; Fri, 21 Feb 2020 14:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W8KaZGmDosurwlNJD9BGtUyzNAa4jQOZ04o70/FjZgc=;
 b=kGkAs4Nbpvsh0LSiFUur6Wb/TbQ7PlbWJAOcbz65Qdv1Uw+Vl3ItNQQMcq77KAYZtJ
 m2urSGoIRXXmBgm7E9zWqbYRJ+5nnXrjCjuYwEMSV5irgIy80/nbHWZ2XU6OXDiBPYJv
 szqdDyeVflofbn6119zAg2Af45wfFrvegUCV58BoK/8EFrO8aWmVrRGB0AEm3jHvnZwq
 g1wiEIh+kkSJDiHR4tM7g/to6tuY6/ds7sh5OENeLGPrw7vXXN0mSnsFAVAAIUn5CXPR
 b8xb4ji8dTq0+IsQw7wVgeeGwqWP+aZc8EV+CmH2yRI8/SyKIhiNvK3/B5nUMCwO2jKu
 gxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W8KaZGmDosurwlNJD9BGtUyzNAa4jQOZ04o70/FjZgc=;
 b=etxvhFvc192WRkycV8soApgtTBKG52Mpg/UON0bMdbdo1/lM1Wv/vrepuinSN5Knkg
 EDse0hfhmy/+5InMjR3W0JMPTO+QRY4RHeSxepn6foXBEGyVwV7+fjIupHHj5/O4khSl
 kS6IEechXF26fjngR4GA60Vg3ucFOEEiuUdJlZteVFDJDtkUat89zfi8ICDDJroAk2zB
 s0b6Gd0cJNU18CXDl1VGpi5M4Xk3xDVX3poXPXexWAmXeshEoCm5uKkd1Eqexcojtvk4
 RojjXTXrEIe5jsy2BSKqwZJRPGVoVjb8kmgzylt0JzbRkFfr+jk4ZlOLxirjvk1F+Fnz
 Zy1g==
X-Gm-Message-State: APjAAAWBsceqZK3HrkYYgZAnYeIptV5APTNlx1pE/LW+x2X4bBTqfXs6
 sxOgHIByOe7gT/rjWWqHFzI=
X-Google-Smtp-Source: APXvYqzuFzGOe6xFIcYN9MIIJZs1pHKUSIf83YFRjQMgSwSuWxPGqeqGheyj2Ocv0clngLUDLTvy9A==
X-Received: by 2002:aa7:8805:: with SMTP id c5mr17210828pfo.142.1582323291138; 
 Fri, 21 Feb 2020 14:14:51 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id h3sm4051033pfr.15.2020.02.21.14.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 14:14:50 -0800 (PST)
Date: Sat, 22 Feb 2020 07:14:47 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] openrisc: use the generic in-place uncached DMA
 allocator
Message-ID: <20200221221447.GA7926@lianli.shorne-pla.net>
References: <20200220170139.387354-1-hch@lst.de>
 <20200220170139.387354-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220170139.387354-3-hch@lst.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: Jonas Bonn <jonas@southpole.se>, Mark Rutland <mark.rutland@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
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

On Thu, Feb 20, 2020 at 09:01:39AM -0800, Christoph Hellwig wrote:
> Switch openrisc to use the dma-direct allocator and just provide the
> hooks for setting memory uncached or cached.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Stafford Horne <shorne@gmail.com>

Also, I test booted openrisc with linux 5.5 + these patches.  Thanks for
continuing to shrink my code base.
 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
