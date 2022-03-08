Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F664D10D5
	for <lists.iommu@lfdr.de>; Tue,  8 Mar 2022 08:20:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 580D8408D1;
	Tue,  8 Mar 2022 07:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id woUQjMmnB64f; Tue,  8 Mar 2022 07:20:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9CDCD40462;
	Tue,  8 Mar 2022 07:20:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6839DC0073;
	Tue,  8 Mar 2022 07:20:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6452AC000B
 for <iommu@lists.linux-foundation.org>; Tue,  8 Mar 2022 07:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CD37408D1
 for <iommu@lists.linux-foundation.org>; Tue,  8 Mar 2022 07:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4P4Nk5uM0Ju for <iommu@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 07:20:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 781B840462
 for <iommu@lists.linux-foundation.org>; Tue,  8 Mar 2022 07:20:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 05D0C68AFE; Tue,  8 Mar 2022 08:20:03 +0100 (CET)
Date: Tue, 8 Mar 2022 08:20:02 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [RESEND] dma-mapping: benchmark: Extract a common header file
 for map_benchmark definition
Message-ID: <20220308072002.GA24887@lst.de>
References: <20220308062857.45585-1-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308062857.45585-1-tiantao6@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: song.bao.hua@hisilicon.com, linuxarm@openeuler.org,
 iommu@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 skhan@linuxfoundation.org, shuah@kernel.org, hch@lst.de
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

On Tue, Mar 08, 2022 at 02:28:57PM +0800, Tian Tao wrote:
> kernel/dma/map_benchmark.c and selftests/dma/dma_map_benchmark.c
> have duplicate map_benchmark definitions, which tends to lead to
> inconsistent changes to map_benchmark on both sides, extract a
> common header file to avoid this problem.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Acked-by: Barry Song <song.bao.hua@hisilicon.com>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  kernel/dma/map_benchmark.c                    | 24 +-------------
>  kernel/dma/map_benchmark.h                    | 31 +++++++++++++++++++
>  .../testing/selftests/dma/dma_map_benchmark.c | 25 +--------------

This needs to go into include/uapi/ instead of using unmaintainable
local includes that poke into other directories.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
