Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60935D08A
	for <lists.iommu@lfdr.de>; Mon, 12 Apr 2021 20:45:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501F840307;
	Mon, 12 Apr 2021 18:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74nyHHIA1v79; Mon, 12 Apr 2021 18:45:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 492A840304;
	Mon, 12 Apr 2021 18:45:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15EA4C0011;
	Mon, 12 Apr 2021 18:45:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B8B9C000A
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 18:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E084040304
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 18:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GH2Iw6DYAkPv for <iommu@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 18:45:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65F62402F7
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 18:45:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69BCD61206;
 Mon, 12 Apr 2021 18:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618253122;
 bh=mawXYSh6eNcajH1P3AgMIeyVtwrpN/4s38ab6F6/ys8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1er7MOxgf1ugZiEtjVuIiKihRKT0JY4jsjFnhR2kOj/szOpUMtwrbzIbbSOFCEZgv
 XtJl+zsdk34WKIH63QM/3nIBSTGPKtmy4g26/r6YWHbcMdxl6PrTrc35a+ndwFLmVO
 0n75s2xu3imSLs+IwJybYBwqkL9u2Bw6cZbmM50k=
Date: Mon, 12 Apr 2021 20:45:19 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Subject: Re: [PATCH 5.4 v2 1/1] iommu/vt-d: Fix agaw for a supported 48 bit
 guest address width
Message-ID: <YHSVPwE5qomsmtSA@kroah.com>
References: <20210407184030.21683-1-saeed.mirzamohammadi@oracle.com>
 <deca9431-a52a-2818-4493-5a6ffeadccb9@linux.intel.com>
 <E3377E7A-073F-4D9C-92FE-8CC4836343AF@oracle.com>
 <036429a7-9924-7ed5-6be9-2bd087594e9b@linux.intel.com>
 <DEA60498-1BFD-441D-B641-BC843695ED96@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DEA60498-1BFD-441D-B641-BC843695ED96@oracle.com>
Cc: Camille Lu <camille.lu@hpe.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

On Mon, Apr 12, 2021 at 06:25:44PM +0000, Saeed Mirzamohammadi wrote:
> Hi Greg,
> 
> This patch fixes an issue with the IOMMU driver and it only applies to 5.4, 4.19, and 4.14 stable kernels. May I know when this patch would be available in the stable kernels?
> 
> Subject: iommu/vt-d: Fix agaw for a supported 48 bit guest address width
> 


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
