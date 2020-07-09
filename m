Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3321A394
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 17:23:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E9487886B7;
	Thu,  9 Jul 2020 15:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MzmBhXf28KrF; Thu,  9 Jul 2020 15:23:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D4CF0814AB;
	Thu,  9 Jul 2020 15:23:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0439C016F;
	Thu,  9 Jul 2020 15:23:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED084C016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 15:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D911A2701D
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 15:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVIDOFx0QGXb for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 15:23:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 9ADBA2587B
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 15:23:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8F70D272; Thu,  9 Jul 2020 17:23:40 +0200 (CEST)
Date: Thu, 9 Jul 2020 17:23:38 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH v3 07/34] iommu: Add probe_device() and release_device()
 call-backs
Message-ID: <20200709152337.GB27672@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
 <20200704090957.8892-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200704090957.8892-1-hdanton@sina.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Markus Elfring <Markus.Elfring@web.de>, Robin Murphy <robin.murphy@arm.com>
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

On Sat, Jul 04, 2020 at 05:09:57PM +0800, Hillf Danton wrote:
> > +	group = iommu_group_get_for_dev(dev);
> > +	if (!IS_ERR(group)) {
> 
> Typo?

Yes, fortunatly it gets fixed again in patch 11 of this series.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
