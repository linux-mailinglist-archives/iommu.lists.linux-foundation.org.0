Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED126A6D4
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 16:10:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3FFB286F6D;
	Tue, 15 Sep 2020 14:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jLhJbHK-oTuy; Tue, 15 Sep 2020 14:10:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE7C386F6C;
	Tue, 15 Sep 2020 14:10:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8ADBC0051;
	Tue, 15 Sep 2020 14:10:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 677FBC0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 14:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5898A2000E
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 14:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyjC7d91px3i for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 14:10:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [66.63.167.143])
 by silver.osuosl.org (Postfix) with ESMTPS id 3F60A20119
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 14:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 9BF068EE188;
 Tue, 15 Sep 2020 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1600179008;
 bh=+R+IKAKZQYkLR7KIiLxpuuPm5bZnjzeal3GKWrEShUo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ZDUvluzGV6yKCC/nF9wrKzitsx/6M3Qz4Dv0CFUEt0vmhscavKWlYegA3t3D9AtoS
 cgl18SKCLQ6g+fOWhOlSE1rajdI6kKqsO/3XSzI9vcO6roMQjXQ+sBvii1pDKecG7Q
 7/nP62+cOOfIkefYX7rGreL2C+Tu2bzmyrkPw+GQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id o2D0dkS7cauB; Tue, 15 Sep 2020 07:10:08 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
 [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 329868EE107;
 Tue, 15 Sep 2020 07:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1600179008;
 bh=+R+IKAKZQYkLR7KIiLxpuuPm5bZnjzeal3GKWrEShUo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ZDUvluzGV6yKCC/nF9wrKzitsx/6M3Qz4Dv0CFUEt0vmhscavKWlYegA3t3D9AtoS
 cgl18SKCLQ6g+fOWhOlSE1rajdI6kKqsO/3XSzI9vcO6roMQjXQ+sBvii1pDKecG7Q
 7/nP62+cOOfIkefYX7rGreL2C+Tu2bzmyrkPw+GQ=
Message-ID: <1600179006.5092.6.camel@HansenPartnership.com>
Subject: Re: [PATCH 07/17] 53c700: improve non-coherent DMA handling
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 15 Sep 2020 07:10:06 -0700
In-Reply-To: <20200915062738.GA19113@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
 <20200914144433.1622958-8-hch@lst.de>
 <1600096818.4061.7.camel@HansenPartnership.com>
 <20200915062738.GA19113@lst.de>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-scsi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
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

On Tue, 2020-09-15 at 08:27 +0200, Christoph Hellwig wrote:
> On Mon, Sep 14, 2020 at 08:20:18AM -0700, James Bottomley wrote:
> > If you're going to change the macros from taking a device to taking
> > a hostdata structure then the descriptive argument name needs to
> > change ... it can't be dev anymore.  I'm happy with it simply
> > becoming 'h' if hostdata is too long.
> > 
> > I already asked for this on the first go around:
> 
> And I did rename them, those hunks just accidentally slipped into
> patch 12 instead of this one.  Fixed for the next versions.

Ah, yes, found it ... thanks for doing that!

James

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
