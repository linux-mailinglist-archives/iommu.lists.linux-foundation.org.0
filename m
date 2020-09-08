Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D6426260A28
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8D2DB86EC8;
	Tue,  8 Sep 2020 05:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-EKesXp2sFH; Tue,  8 Sep 2020 05:36:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EE18A86E5C;
	Tue,  8 Sep 2020 05:36:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2D2BC089E;
	Tue,  8 Sep 2020 05:36:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D10ADC0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 05:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B75D48610F
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 05:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1u3MX30d7ajN for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 05:36:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 96720860F0
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 05:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tnIhBm/D9q30OCjl0Uvk6IczrpKqywtr99E3Z7cDOcY=; b=A7cOmnVXCZtWAnsWTe66XL2mO2
 EfgFVttWjeSLSSOW7M36RucpwOpruW5Go8mkpQ5cD7T0J+07ypNo8hiB1Xuxa62/LM3ciqjLddxHv
 xRrWNTfI9+FCCIHBqmRat5fAniV5XoT3gd4rkXV0XBIex7sniDbxfzTpR9WqhPmTk0d8tJXk7y1oZ
 jwShC3NettOOKABfpiYOFXx730naA1c5vdvjOVfcLXmzLB70bqh/LkhPpc6V6jKL77EIL+9N/T6Fi
 lxgKjyEDm7kq9V2R/eQojzNIjMHQCRKlWOLKzMxzwKo6SZzs1YMFkDgc6hzdfs7ZnDpdIS3qBRgdJ
 WWIrZI2g==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kFWIl-00044r-4s; Tue, 08 Sep 2020 05:36:19 +0000
Date: Tue, 8 Sep 2020 06:36:19 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Tom Murphy <murphyt7@tcd.ie>
Subject: Re: [PATCH V2 5/5] DO NOT MERGE: iommu: disable list appending in
 dma-iommu
Message-ID: <20200908053619.GA15418@infradead.org>
References: <20200903201839.7327-1-murphyt7@tcd.ie>
 <20200903201839.7327-6-murphyt7@tcd.ie>
 <20200907070035.GA25114@infradead.org>
 <CALQxJute8_y=JsW4UV1awSccOjxT_1OyPdymq=R_PurVQzENeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALQxJute8_y=JsW4UV1awSccOjxT_1OyPdymq=R_PurVQzENeQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Woodhouse <dwmw2@infradead.org>
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

On Mon, Sep 07, 2020 at 09:18:50PM +0100, Tom Murphy wrote:
> Yeah we talked about passing an attr to map_sg to disable merging at
> the following microconfernce:
> https://linuxplumbersconf.org/event/7/contributions/846/
> As far as I can remember everyone seemed happy with that solution. I
> won't be working on this though as I don't have any more time to
> dedicate to this. It seems Lu Baolu will take over this.

I'm absolutely again passing a flag.  Tha just invites further
abuse.  We need a PCI ID based quirk or something else that can't
be as easily abused.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
