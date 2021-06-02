Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F663983E0
	for <lists.iommu@lfdr.de>; Wed,  2 Jun 2021 10:09:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF9C140354;
	Wed,  2 Jun 2021 08:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2k5VbNCDDn-z; Wed,  2 Jun 2021 08:09:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id B30DE403B1;
	Wed,  2 Jun 2021 08:09:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CF76C0024;
	Wed,  2 Jun 2021 08:09:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10587C0001
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 08:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F04338293D
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 08:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPv8oIHfCUZp for <iommu@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 08:09:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6CC3828FB
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 08:09:44 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1loLwV-0002ok-8U; Wed, 02 Jun 2021 10:09:35 +0200
Received: from [85.7.101.30] (helo=linux-2.home)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1loLwU-000CT0-Vm; Wed, 02 Jun 2021 10:09:35 +0200
Subject: Re: Regression 5.12.0-rc4 net: ice: significant throughput drop
To: Jussi Maki <joamaki@gmail.com>, Robin Murphy <robin.murphy@arm.com>
References: <CAHn8xckNXci+X_Eb2WMv4uVYjO2331UWB2JLtXr_58z0Av8+8A@mail.gmail.com>
 <cc58c09e-bbb5-354a-2030-bf8ebb2adc86@iogearbox.net>
 <7f048c57-423b-68ba-eede-7e194c1fea4e@arm.com>
 <CAHn8xckNt3smeQPi3dgq5i_3vP7KwU45pnP5OCF8nOV_QEdyMA@mail.gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <7c04eeea-22d3-c265-8e1e-b3f173f2179f@iogearbox.net>
Date: Wed, 2 Jun 2021 10:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHn8xckNt3smeQPi3dgq5i_3vP7KwU45pnP5OCF8nOV_QEdyMA@mail.gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.2/26188/Tue Jun  1 13:07:16 2021)
Cc: jroedel@suse.de, netdev@vger.kernel.org, jesse.brandeburg@intel.com,
 hch@lst.de, iommu@lists.linux-foundation.org, anthony.l.nguyen@intel.com,
 gregkh@linuxfoundation.org, intel-wired-lan@lists.osuosl.org,
 bpf <bpf@vger.kernel.org>, davem@davemloft.net
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

On 6/1/21 7:42 PM, Jussi Maki wrote:
> Hi Robin,
> 
> On Tue, Jun 1, 2021 at 2:39 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>>> The regression shows as a significant drop in throughput as measured
>>>> with "super_netperf" [0],
>>>> with measured bandwidth of ~95Gbps before and ~35Gbps after:
>>
>> I guess that must be the difference between using the flush queue
>> vs. strict invalidation. On closer inspection, it seems to me that
>> there's a subtle pre-existing bug in the AMD IOMMU driver, in that
>> amd_iommu_init_dma_ops() actually runs *after* amd_iommu_init_api()
>> has called bus_set_iommu(). Does the patch below work?
> 
> Thanks for the quick response & patch. I tried it out and indeed it
> does solve the issue:
> 
> # uname -a
> Linux zh-lab-node-3 5.13.0-rc3-amd-iommu+ #31 SMP Tue Jun 1 17:12:57
> UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
> root@zh-lab-node-3:~# ./super_netperf 32 -H 172.18.0.2
> 95341.2
> 
> root@zh-lab-node-3:~# uname -a
> Linux zh-lab-node-3 5.13.0-rc3-amd-iommu-unpatched #32 SMP Tue Jun 1
> 17:29:34 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
> root@zh-lab-node-3:~# ./super_netperf 32 -H 172.18.0.2
> 33989.5

Robin, probably goes without saying, but please make sure to include ...

Fixes: a250c23f15c2 ("iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE")

... to your fix in [0], maybe along with another Fixes tag pointing to the original
commit adding this issue. But certainly a250c23f15c2 would be good given the regression
was uncovered on that one first, so that Greg et al have a chance to pick this fix up
for stable kernels.

Thanks everyone!

   [0] https://lore.kernel.org/bpf/7f048c57-423b-68ba-eede-7e194c1fea4e@arm.com/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
