Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E61C0E75
	for <lists.iommu@lfdr.de>; Fri,  1 May 2020 09:07:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D58A28907E;
	Fri,  1 May 2020 07:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 670rIIGG8kNl; Fri,  1 May 2020 07:07:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32E3B8907B;
	Fri,  1 May 2020 07:07:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CDAEC088F;
	Fri,  1 May 2020 07:07:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50A41C016F
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 07:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4410E2DA3F
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 07:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Prti55+KVMsX for <iommu@lists.linux-foundation.org>;
 Fri,  1 May 2020 07:07:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id C5A2E2C34A
 for <iommu@lists.linux-foundation.org>; Fri,  1 May 2020 07:07:28 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 787A320787;
 Fri,  1 May 2020 07:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588316848;
 bh=HIfMpi3S18ct8unQ/R+ubNZwKhps7K77SVC39pepDOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jJ2GAeNdWdjuxBuST3M1Md1YH7ok04v42aeOXmpkPY2wz3GqCEaE9hkfcGvfqi459
 2OfkycLqKtEQZdpyYWTFJyP8cwf7Crgb3ZneU/QW3pynODzEDZLhR6oFKIAkQtX/f+
 U4XXhPogWkf+4cW5SuzPtU5eAdnOHUeoB9RbBGQE=
Date: Fri, 1 May 2020 08:07:24 +0100
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] drivers/iommu: properly export iommu_group_get_for_dev
Message-ID: <20200501070723.GA9186@willie-the-truck>
References: <20200430120120.2948448-1-gregkh@linuxfoundation.org>
 <20200430121753.GA22842@willie-the-truck>
 <20200430122332.GP21900@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430122332.GP21900@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-kernel@vger.kernel.org
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

On Thu, Apr 30, 2020 at 02:23:32PM +0200, Joerg Roedel wrote:
> On Thu, Apr 30, 2020 at 01:17:53PM +0100, Will Deacon wrote:
> > Thanks, not sure how I managed to screw this up in the original patch!
> > 
> > Acked-by: Will Deacon <will@kernel.org>
> > 
> > Joerg -- can you pick this one up please?
> 
> Yes, will send it as a fix for 5.7, but note that this function will be
> unexported in 5.8.

Thanks, Joerg.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
