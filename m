Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919A24D784
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 16:43:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4239C8802E;
	Fri, 21 Aug 2020 14:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IobJM6sIThhu; Fri, 21 Aug 2020 14:43:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 81F9B8800F;
	Fri, 21 Aug 2020 14:43:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74142C0051;
	Fri, 21 Aug 2020 14:43:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0D69C0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 14:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D9A808565B
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 14:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZk0CUeHnlJm for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 14:43:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4042C8457E
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 14:43:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42071AC82;
 Fri, 21 Aug 2020 14:43:57 +0000 (UTC)
Date: Fri, 21 Aug 2020 16:43:27 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [Regression] "iommu/amd: Relax locking in dma_ops path" makes
 tg3 ethernet transmit queue timeout
Message-ID: <20200821144327.GN3354@suse.de>
References: <4E9B03FB-9DA5-4831-B4CE-A0AA645D3F22@canonical.com>
 <20200518133209.GM8135@suse.de>
 <381D21C9-C913-4C33-A6F4-0440B5D11670@canonical.com>
 <8D375E06-A763-4B5E-9C6D-DA5EBC62530E@canonical.com>
 <CFC22DE4-E342-4F32-B758-6A690755C498@canonical.com>
 <20200821134300.GM3354@suse.de>
 <5D7A63DF-D360-4453-845C-924F4C13E3DB@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D7A63DF-D360-4453-845C-924F4C13E3DB@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, open list <linux-kernel@vger.kernel.org>
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

On Fri, Aug 21, 2020 at 09:50:33PM +0800, Kai-Heng Feng wrote:
> Of course, I still have the system at my side.
> 
> The offending commit is 92d420ec028d ("iommu/amd: Relax locking in
> dma_ops path"), however be62dbf554c5 ("iommu/amd: Convert AMD iommu
> driver to the dma-iommu api") removed .map_page entirely so I don't
> know where to start.

I guess you don't see any AMD-Vi page-faults reported in dmesg, right?
That makes things more difficult. As a first step, can you please send
me a complete dmesg after this happened? Also please boot with
amd_iommu_dump on the kernel command line.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
