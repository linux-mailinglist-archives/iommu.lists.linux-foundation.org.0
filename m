Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E832B7E4B
	for <lists.iommu@lfdr.de>; Wed, 18 Nov 2020 14:29:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCCBA85565;
	Wed, 18 Nov 2020 13:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rdfOZI2lE9go; Wed, 18 Nov 2020 13:28:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 38C2F85404;
	Wed, 18 Nov 2020 13:28:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CCAAC07FF;
	Wed, 18 Nov 2020 13:28:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5417AC07FF
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 13:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 417EA86DCA
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 13:28:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYJO2g72xrxz for <iommu@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 13:28:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2D73F86D73
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 13:28:56 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BA0D2168B;
 Wed, 18 Nov 2020 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605706135;
 bh=GXB+cRJ8S+Trf+du81PieNJ/TBxT7l3tdYWwgb2rQhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xTg6/kl1kBQzTpCAQlHPbXFP963UAv5vU9c3sWuwOg1Q3oOt7LIi8zLZ5wqCh2xzx
 fJw+EPx6TOuIsdIszc1YozVWGx2fKeLuxGiD/uufdJoiWaqths4pvkKeyz/V7DgVMQ
 646pu+Law3l7M2mne3g3XllKxsM4mwgV0lutbCe0=
Date: Wed, 18 Nov 2020 13:28:50 +0000
From: Will Deacon <will@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2] iommu/vt-d: avoid unnecessory panic if iommu init
 fail in tboot system
Message-ID: <20201118132849.GB2029@willie-the-truck>
References: <20201110071908.3133-1-zhenzhong.duan@gmail.com>
 <34e8f6c6-e9f7-634b-8f68-3645261fd882@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34e8f6c6-e9f7-634b-8f68-3645261fd882@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tboot-devel@lists.sourceforge.net, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 ning.sun@intel.com, Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, dwmw2@infradead.org
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

On Wed, Nov 18, 2020 at 07:32:25AM +0800, Lu Baolu wrote:
> Please consider this patch for v5.10.

Cheers, I'll stick this onto a fixes branch momentarily.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
