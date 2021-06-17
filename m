Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F32F3ABDFC
	for <lists.iommu@lfdr.de>; Thu, 17 Jun 2021 23:27:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B12A783EBB;
	Thu, 17 Jun 2021 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHFfNnORQcfe; Thu, 17 Jun 2021 21:27:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CD58083E83;
	Thu, 17 Jun 2021 21:27:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A3D3C000B;
	Thu, 17 Jun 2021 21:27:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29963C000B
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 20:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 036354002B
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 20:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cF9E87XA1tMm for <iommu@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 20:51:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20401405FA
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 20:51:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBBDD610A1;
 Thu, 17 Jun 2021 20:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623963087;
 bh=0KQKeh6bgDXKLLGwLRbNVUBv4sRzxd+Azd43XYpTEYM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IaZG7YAL+8RHGZTi0zuz/Zmlj3ZP7YPWLhB5WK9WQBV9LW0iC+Dx3ciTxt/GMjqET
 iOvOakqmrtE3K+f5M9V/yp2TQJ2TzcksLWz6Kr6rovbEFSeaQUmMvrBVdw7feYyCcY
 VCZSSQ5SBcSJGvRfOUOZolrSCllyUKTPRno2SMM7zJGM1WDh0h1yYpbpQcsLut3FOu
 cp5ewr9cvYdV4PtQ22wWvTGmPgjNj9rG5EK04Za8zi97zGGu+uiJP9wH8ljxSb6OtU
 /RS9GDyZ7z/loLPdLbN7/6Ve2ebKbXu51paKHQDjz6Xfs7OHYlKi4lupESpw9WMuwb
 07gUt04PDRpMg==
Subject: Re: [PATCH] iommu/vt-d: Fix W=1 clang warning in intel/perf.c
To: Joerg Roedel <jroedel@suse.de>, Nick Desaulniers <ndesaulniers@google.com>
References: <20210617145339.2692-1-joro@8bytes.org>
 <CAKwvOd=8jUsRFKg6+sqq2-DakbRBGR6Z6mR_smuxp+cMEmCHLw@mail.gmail.com>
 <YMuw+LtM/B1QTTJI@suse.de>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <32f14288-315a-b75d-913b-2fc6a16cd748@kernel.org>
Date: Thu, 17 Jun 2021 13:51:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMuw+LtM/B1QTTJI@suse.de>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 17 Jun 2021 21:27:12 +0000
Cc: kernel test robot <lkp@intel.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 6/17/2021 1:30 PM, Joerg Roedel wrote:
> On Thu, Jun 17, 2021 at 10:16:50AM -0700, Nick Desaulniers wrote:
>> On Thu, Jun 17, 2021 at 7:54 AM Joerg Roedel <joro@8bytes.org> wrote:
>>>
>>> From: Joerg Roedel <jroedel@suse.de>
>>>
>>> Fix this warning when compiled with clang and W=1:
>>>
>>>          drivers/iommu/intel/perf.c:16: warning: Function parameter or member 'latency_lock' not described in 'DEFINE_SPINLOCK'
>>>          drivers/iommu/intel/perf.c:16: warning: expecting prototype for perf.c(). Prototype was for DEFINE_SPINLOCK() instead
>>
>> I think these warnings are actually produced by kernel-doc? (not clang)
> 
> Will kernel-doc check automatically when COMPILER=clang is set and W=1?
> Because I did not explicitly enable any kernel-doc checks.
> 
> Regards,
> 
> 	Joerg
> 

kernel-doc is run automatically with W=1, regardless of gcc versus clang.

Cheers,
Nathan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
