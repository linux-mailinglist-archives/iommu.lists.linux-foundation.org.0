Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C22AB316F34
	for <lists.iommu@lfdr.de>; Wed, 10 Feb 2021 19:51:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 814318744A;
	Wed, 10 Feb 2021 18:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 943phLe6ZUg3; Wed, 10 Feb 2021 18:51:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 05EA08743A;
	Wed, 10 Feb 2021 18:51:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E20D8C0174;
	Wed, 10 Feb 2021 18:51:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA887C0174
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 18:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 97D4886E3F
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 18:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOYw0cQqEzDV for <iommu@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 18:51:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B487386EC3
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 18:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EjxwxHUNaOq23km6417evCVsqogE3nHC3sVFoKbPKg8=; b=cbatPENJ45p15QeKsGBV3IHWYB
 MYY+XRAjvFdyEP+iDEN7xkSzpBF8JaSpuGwjfgDQQEVoM/xpsvi3INdXoOuJZl4r0QQlnvHCCAciJ
 K/i0cA3Pwgde9FWWOLhdkA6YYagUEcEIMGbqk7+KZOOQ+qxq6cOSsGyLEBBVqyg8IR/EhcXGSzAi5
 DrmHQ7abaKogcEgwxl2IxF8lApwCsy2ypMG647U37oOag2em5SznPVPpv05MjbAzva3gYU3woa/oH
 +xIIvR6HMXdLr+peIu0bMCI/atrUkCcGpsugia1PXfoSpgp6DYOk2ID3l6Da2Zgsc8BsE+tykWGjN
 kz8+SQ8Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l9uZg-009FhE-Fm; Wed, 10 Feb 2021 18:50:53 +0000
Date: Wed, 10 Feb 2021 18:50:52 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory pin
Message-ID: <20210210185052.GE308988@casper.infradead.org>
References: <1612685884-19514-2-git-send-email-wangzhou1@hisilicon.com>
 <ED58431F-5972-47D1-BF50-93A20AD86C46@amacapital.net>
 <2e6cf99f-beb6-9bef-1316-5e58fb0aa86e@hisilicon.com>
 <YCJX6QFQ4hsNRrFj@kroah.com>
 <f73951ba-84be-b7f8-8c79-db84bc9081f3@hisilicon.com>
 <YCJ5k/Bxxkg3BNNj@kroah.com>
 <2237506a-0c98-7ba6-5d5f-b60b637174c5@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2237506a-0c98-7ba6-5d5f-b60b637174c5@hisilicon.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com,
 Sihang Chen <chensihang1@hisilicon.com>, jgg@ziepe.ca,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-api@vger.kernel.org, zhangfei.gao@linaro.org,
 Andrew Morton <akpm@linux-foundation.org>, liguozhu@hisilicon.com,
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

On Tue, Feb 09, 2021 at 08:20:18PM +0800, Zhou Wang wrote:
> Agree, will add it in next version.

No, don't do another version.  Jason is right, this approach is wrong.
The point of SVA is that it doesn't require the application to do
anything special.  If jitter from too-frequent page migration is actually
a problem, then fix the frequency of page migration.  Don't pretend that
this particular application is so important that it prevents the kernel
from doing its housekeeping.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
