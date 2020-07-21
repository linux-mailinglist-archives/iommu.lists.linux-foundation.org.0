Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4BA227F0C
	for <lists.iommu@lfdr.de>; Tue, 21 Jul 2020 13:37:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EE73F220D6;
	Tue, 21 Jul 2020 11:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9m6r5Ek0LsH; Tue, 21 Jul 2020 11:37:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5ECAC2202C;
	Tue, 21 Jul 2020 11:37:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BC35C08A6;
	Tue, 21 Jul 2020 11:37:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7F70C016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 11:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CD5052050F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 11:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57xhUI7KPK34 for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:37:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 15B0020412
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 11:37:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D424AD25;
 Tue, 21 Jul 2020 11:37:19 +0000 (UTC)
Message-ID: <d073fc344a4ec458aa3456b6838e2000f042f8e2.camel@suse.de>
Subject: Re: [PATCH] dma-pool: Do not allocate pool memory from CMA
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>, Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 21 Jul 2020 13:37:11 +0200
In-Reply-To: <20200721112842.GB27356@lst.de>
References: <20200708164936.9340-1-nsaenzjulienne@suse.de>
 <CAMi1Hd35tRM=cnmzwX=SDgu-OoXi1Xj+twFkoULaVZBbTpe6sw@mail.gmail.com>
 <550b30a86c0785049d24c945e2c6628d491cee3a.camel@suse.de>
 <CAMi1Hd2V2pJjP=USS4r-Z3vK-aq7_aBy-jcVNk1GvbdEQAuzWg@mail.gmail.com>
 <011994f8a717a00dcd9ed7682a1ddeb421c2c43f.camel@suse.de>
 <20200721112842.GB27356@lst.de>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Cc: lkml <linux-kernel@vger.kernel.org>, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, John Stultz <john.stultz@linaro.org>,
 linux-rpi-kernel@lists.infradead.org, David Rientjes <rientjes@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>
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

On Tue, 2020-07-21 at 13:28 +0200, Christoph Hellwig wrote:
> On Tue, Jul 21, 2020 at 01:15:23PM +0200, Nicolas Saenz Julienne
> wrote:
> > I'm at loss at what could be failing here. Your device should be
> > able
> > to address the whole 8GB memory space, which AFAIK is the max
> > available
> > on that smartphone family. But maybe the device-tree is lying, who
> > knows...
> 
> Maybe we should give your patch to allocate from CMA but check the
> address a try?  (just because we can..)

Yes, good idea!

Amir, could you also test this patch[1] (having reverted the one that
casues trouble) and report on whether it boots or not?

Regards,
Nicolas

[1] https://lore.kernel.org/linux-iomhttps://lore.kernel.org/linux-iom
mu/fe14037b02fd887a73cd91c115dccc4485f8446e.camel@suse.de/T/#t


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
