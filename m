Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006525F378
	for <lists.iommu@lfdr.de>; Mon,  7 Sep 2020 09:00:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D29182049F;
	Mon,  7 Sep 2020 07:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwS5RF02V2Hn; Mon,  7 Sep 2020 07:00:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D6C8C2047B;
	Mon,  7 Sep 2020 07:00:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0944C0051;
	Mon,  7 Sep 2020 07:00:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90CEEC0051
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 07:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8BA1A8708A
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 07:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWHaTJwQ1x-L for <iommu@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 07:00:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 797FF8541F
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mOwuNgBR5sDIJB+BvLt/e/G3W0U4pZcy6kQxubHpOsc=; b=g4rWFwqPV1Go6Awo3Xadh/+FTc
 rhkqVOirmN3euJ0YqlVMZuHmarTPW9k/+KBS0IBJiq7PF6T/kKmi+Jfc3KrgtB827pIK6HWC/Mdht
 5xhoUhE0TgTLAd6RWIpqSgFwrqFKpVC7zMd2tCVTTzzCpWaSypFoADb7e9sp/QltHPE07bTrXlPCo
 jJpbTL7D5CEklu82hlfFs0pIt6EB91s9Pmo7ouUpJXku2JCl7cHofEBhAXLGEdBYyHfDd6vouz/NI
 JFp7LEB0sCZpyV49c8FZmuTBa8B14Fk7K9ICTPjCb0tLjN2FnTVYTfg2bFkUBB72NcK8nFsDXX9cL
 9fzmjARw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kFB8l-0006fv-7r; Mon, 07 Sep 2020 07:00:35 +0000
Date: Mon, 7 Sep 2020 08:00:35 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Tom Murphy <murphyt7@tcd.ie>
Subject: Re: [PATCH V2 5/5] DO NOT MERGE: iommu: disable list appending in
 dma-iommu
Message-ID: <20200907070035.GA25114@infradead.org>
References: <20200903201839.7327-1-murphyt7@tcd.ie>
 <20200903201839.7327-6-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903201839.7327-6-murphyt7@tcd.ie>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 iommu@lists.linux-foundation.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Woodhouse <dwmw2@infradead.org>
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

On Thu, Sep 03, 2020 at 09:18:37PM +0100, Tom Murphy wrote:
> Disable combining sg segments in the dma-iommu api.
> Combining the sg segments exposes a bug in the intel i915 driver which
> causes visual artifacts and the screen to freeze. This is most likely
> because of how the i915 handles the returned list. It probably doesn't
> respect the returned value specifying the number of elements in the list
> and instead depends on the previous behaviour of the intel iommu driver
> which would return the same number of elements in the output list as in
> the input list.

So what is the state of addressing this properly in i915?  IF we can't
get it done ASAP I wonder if we need a runtime quirk to disable
merging instead of blocking this conversion..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
