Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 702531CF8C3
	for <lists.iommu@lfdr.de>; Tue, 12 May 2020 17:16:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 21252873EF;
	Tue, 12 May 2020 15:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-v8amnfw5gv; Tue, 12 May 2020 15:16:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E962873F9;
	Tue, 12 May 2020 15:16:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 835C2C016F;
	Tue, 12 May 2020 15:16:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62AE0C016F
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 15:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 51654873D1
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 15:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BgkNO68lR91S for <iommu@lists.linux-foundation.org>;
 Tue, 12 May 2020 15:16:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 178CE873EF
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 15:16:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 713BDAD31;
 Tue, 12 May 2020 15:16:05 +0000 (UTC)
Date: Tue, 12 May 2020 17:16:00 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: next/master bisection: baseline.login on jetson-tk1
Message-ID: <20200512151600.GD8135@suse.de>
References: <5eb9fab4.1c69fb81.a1f1c.0e95@mx.google.com>
 <a868fa70-9039-f72a-39c6-5464a9d06db2@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a868fa70-9039-f72a-39c6-5464a9d06db2@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-next@vger.kernel.org
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

Hi Guillaume,

thanks for the report!

On Tue, May 12, 2020 at 07:05:13AM +0100, Guillaume Tucker wrote:
> > Summary:
> >   Start:      4b20e7462caa6 Add linux-next specific files for 20200511
> >   Plain log:  https://storage.kernelci.org/next/master/next-20200511/arm/tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.txt
> >   HTML log:   https://storage.kernelci.org/next/master/next-20200511/arm/tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.html
> >   Result:     3eeeb45c6d044 iommu: Remove add_device()/remove_device() code-paths

Okay, so it faults at

	PC is at __iommu_probe_device+0x20/0x1b8

Can you translate that for me into a code-line, please? That would help
finding the issue.


Thanks,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
