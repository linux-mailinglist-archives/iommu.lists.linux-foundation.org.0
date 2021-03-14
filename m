Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A94C33A5D4
	for <lists.iommu@lfdr.de>; Sun, 14 Mar 2021 16:58:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92C416F500;
	Sun, 14 Mar 2021 15:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOI7zh_V8OdU; Sun, 14 Mar 2021 15:58:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 911D16F4D6;
	Sun, 14 Mar 2021 15:58:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58E59C0012;
	Sun, 14 Mar 2021 15:58:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DB03C0001;
 Sun, 14 Mar 2021 15:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 039DE49ED5;
 Sun, 14 Mar 2021 15:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FDK3plGkY-cd; Sun, 14 Mar 2021 15:58:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9847D49DEA;
 Sun, 14 Mar 2021 15:58:18 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7C42968B05; Sun, 14 Mar 2021 16:58:13 +0100 (CET)
Date: Sun, 14 Mar 2021 16:58:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH 15/17] iommu: remove DOMAIN_ATTR_NESTING
Message-ID: <20210314155813.GA788@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-16-hch@lst.de>
 <3e8f1078-9222-0017-3fa8-4d884dbc848e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e8f1078-9222-0017-3fa8-4d884dbc848e@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-msm@vger.kernel.org
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

On Sun, Mar 14, 2021 at 11:44:52AM +0100, Auger Eric wrote:
> As mentionned by Robin, there are series planning to use
> DOMAIN_ATTR_NESTING to get info about the nested caps of the iommu (ARM
> and Intel):
> 
> [Patch v8 00/10] vfio: expose virtual Shared Virtual Addressing to VMs
> patches 1, 2, 3
> 
> Is the plan to introduce a new domain_get_nesting_info ops then?

The plan as usual would be to add it the series adding that support.
Not sure what the merge plans are - if the series is ready to be
merged I could rebase on top of it, otherwise that series will need
to add the method.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
