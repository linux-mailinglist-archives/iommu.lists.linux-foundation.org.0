Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D1255889
	for <lists.iommu@lfdr.de>; Fri, 28 Aug 2020 12:29:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B477B228DC;
	Fri, 28 Aug 2020 10:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oF+-uekvyipv; Fri, 28 Aug 2020 10:29:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7F17020134;
	Fri, 28 Aug 2020 10:29:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D613C0051;
	Fri, 28 Aug 2020 10:29:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F56FC0051
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 10:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 95380883F0
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 10:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rfxLATNim8NB for <iommu@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 10:29:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 85273883C0
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 10:29:32 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11BCE2080C;
 Fri, 28 Aug 2020 10:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598610572;
 bh=OM0xDviExPMs25X2djcfNEdWDnV1PejufaV7fIDxStc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zUNtDENk4ICQ8nLWM16O2yclgqOzaKohnholRoFV5bpNLhnMucSqN7r68fxxZUXi0
 OJxHoK0mbSbxdpsVucJwPxRYKdUF/AaeMFVMkedUbEoFfz0Y8/5CgGchloDeiuGSrX
 Ryqe/7AuLbZdxTKaD+gXilydDho1fJi+m9JeTzaU=
Date: Fri, 28 Aug 2020 11:29:27 +0100
From: Will Deacon <will@kernel.org>
To: Barry Song <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: add tracepoints for cmdq_issue_cmdlist
Message-ID: <20200828102927.GA30391@willie-the-truck>
References: <20200827093351.15244-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827093351.15244-1-song.bao.hua@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
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

On Thu, Aug 27, 2020 at 09:33:51PM +1200, Barry Song wrote:
> cmdq_issue_cmdlist() is the hotspot that uses a lot of time. This patch
> adds tracepoints for it to help debug.
> 
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  * can furthermore develop an eBPF program to benchmark using this trace

Hmm, don't these things have a history of becoming ABI? If so, I don't
really want them in the driver at all, sorry. Do other drivers overcome
this somehow?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
