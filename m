Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D102B4A8052
	for <lists.iommu@lfdr.de>; Thu,  3 Feb 2022 09:26:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE5083E8C;
	Thu,  3 Feb 2022 08:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WViszqanXI_5; Thu,  3 Feb 2022 08:26:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B219A83E52;
	Thu,  3 Feb 2022 08:26:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7906AC0039;
	Thu,  3 Feb 2022 08:26:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3DA8C000B
 for <iommu@lists.linux-foundation.org>; Thu,  3 Feb 2022 08:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D0BA4011C
 for <iommu@lists.linux-foundation.org>; Thu,  3 Feb 2022 08:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZF7QFr2btB_s for <iommu@lists.linux-foundation.org>;
 Thu,  3 Feb 2022 08:26:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC7F440110
 for <iommu@lists.linux-foundation.org>; Thu,  3 Feb 2022 08:26:01 +0000 (UTC)
Received: from 8bytes.org
 (p200300c27725810051e7935629d89dab.dip0.t-ipconnect.de
 [IPv6:2003:c2:7725:8100:51e7:9356:29d8:9dab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 92CDF1D5;
 Thu,  3 Feb 2022 09:25:58 +0100 (CET)
Date: Thu, 3 Feb 2022 09:25:58 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 1/2] iommu/vt-d: Fix PCI bus rescan device hot add
Message-ID: <20220203082150.qjsssis6ygh34yen@8bytes.org>
References: <20220128031002.2219155-1-baolu.lu@linux.intel.com>
 <20220128031002.2219155-2-baolu.lu@linux.intel.com>
 <YfZBlzYTN/RfCGnE@8bytes.org>
 <d9c35bb7-e6f5-a439-505b-5352c34f5621@arm.com>
 <YfgFqp+lR9wRdUWn@8bytes.org>
 <20220201111918.48aadfdf@jacob-builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201111918.48aadfdf@jacob-builder>
Cc: iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Guoqing Jiang <guoqing.jiang@linux.dev>, Bernice <bernice.zhang@intel.com>
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

On Tue, Feb 01, 2022 at 11:19:18AM -0800, Jacob Pan wrote:
> Do you mean having an IRQ remapping notifier regardless IOMMU-API is
> enabled, right?
> It make sense, I will give it a try.

Yeah, that would be best. I really don't like to use two notifiers just
to work around ordering issues.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
