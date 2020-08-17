Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C024636A
	for <lists.iommu@lfdr.de>; Mon, 17 Aug 2020 11:32:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5822987799;
	Mon, 17 Aug 2020 09:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Ar9c++Hu2KK; Mon, 17 Aug 2020 09:32:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E282877D4;
	Mon, 17 Aug 2020 09:32:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE25C0051;
	Mon, 17 Aug 2020 09:32:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 638AEC0051
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 09:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4DA9487799
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 09:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOy8Te9raj47 for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 09:31:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E94B8777F
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+Mwzdd5TmWK436GJyXFCq0eX/F+xGzHfq7QX6jo+m2U=; b=vJKwxIRw343oq9qZRi0kzGe4Qu
 HBUYrr3bBRrN5xeRPLrsHf3I0ASm9oaBh9OSM3AaYprIySLCLkYY0MQOyXW+dqVi1RWM79M0b6ge0
 06aid+RM0YK64s7IkRC6+0NxbOiDRFe7IYqpi2CeVMZghgSNOdwuJl4ChM2BAR7xaBs7wYmEENtKq
 Lv02UzXmgYmi24EleG4we86LcRfVtN5+PJooB4eRZxqyml19UNk6255TOUCPub5DLJP05AwBYwDgf
 WUjUVq9ankXrJGQrOunw+MlkyIEFlQ0xIKZrQYPveJkHVld7RPDUa0ceDapXJ1njxF4IShH1hJ70S
 V+nIYjkQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k7bUM-00035D-Ni; Mon, 17 Aug 2020 09:31:34 +0000
Date: Mon, 17 Aug 2020 10:31:34 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/16] IOMMU driver for Kirin 960/970
Message-ID: <20200817093134.GA11250@infradead.org>
References: <cover.1597650455.git.mchehab+huawei@kernel.org>
 <20200817082106.GA16296@infradead.org>
 <20200817112725.26f1b7d6@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817112725.26f1b7d6@coco.lan>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
 Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>,
 Chenfeng <puck.chen@hisilicon.com>, mauro.chehab@huawei.com,
 Suzhuangluan <suzhuangluan@hisilicon.com>,
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

On Mon, Aug 17, 2020 at 11:27:25AM +0200, Mauro Carvalho Chehab wrote:
> I need to start from the original patch in order to preserve its
> authorship.

Nom you don't.  We have plenty of example where people submit code
written by other, especially when it is significantly reworked,

> My plan is to work with the iommu subsystem maintainers after
> have this (and another pending patch series for DRM) merged.

Please submit it to the iommu list directly.  Seriously - you did not
even cc the relevant list, and you don't even have a comment from
the maintainers.  Don't do this kind of crap.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
