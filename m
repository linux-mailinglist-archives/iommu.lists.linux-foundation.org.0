Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A21592A3
	for <lists.iommu@lfdr.de>; Tue, 11 Feb 2020 16:13:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9BF9F204E5;
	Tue, 11 Feb 2020 15:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jrDKlaq5dTX5; Tue, 11 Feb 2020 15:13:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C0C7E204C4;
	Tue, 11 Feb 2020 15:13:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9302C07FE;
	Tue, 11 Feb 2020 15:13:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A81EEC07FE
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 15:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9577E84FB9
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 15:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfEDfEDQ5vTg for <iommu@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 15:13:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5FAED84E42
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 15:13:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A95AD31B;
 Tue, 11 Feb 2020 07:13:00 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3AB53F68E;
 Tue, 11 Feb 2020 07:12:59 -0800 (PST)
Subject: Re: AMD IOMMU stops RDMA NFS from working since kernel 5.5 (bisected)
To: Chuck Lever <chuck.lever@oracle.com>, Andre Tomt <andre@tomt.net>,
 Tom Murphy <tmurphy@arista.com>
References: <7ee099af-e6bb-18fe-eb93-2a8abd401570@tomt.net>
 <20200211072537.GD23114@suse.de>
 <2CE039F4-3519-4481-B0E2-840D24EE4428@oracle.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ac758665-9127-9a52-4f03-49fecc5289a2@arm.com>
Date: Tue, 11 Feb 2020 15:12:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2CE039F4-3519-4481-B0E2-840D24EE4428@oracle.com>
Content-Language: en-GB
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Joerg Roedel <jroedel@suse.de>, iommu@lists.linux-foundation.org
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

On 11/02/2020 1:48 pm, Chuck Lever wrote:
> Andre-
> 
> Thank you for the detailed report!
> 
> Tom-
> 
> There is a rich set of trace points available in the RPC/RDMA implementation in 5.4/5.5, fwiw.
> Please keep me in the loop, let me know if there is anything I can do to help.

One aspect that may be worth checking is whether there's anywhere that 
assumes a successful return value from dma_map_sg() is always the same 
as the number of entries passed in - that's the most obvious way the 
iommu-dma code differs (legitimately) from the previous amd-iommu 
implementation.

Robin.

>> On Feb 11, 2020, at 2:25 AM, Joerg Roedel <jroedel@suse.de> wrote:
>>
>> Adding Tom's new email address.
>>
>> Tom, can you have a look, please?
>> https://bugzilla.kernel.org/show_bug.cgi?id=206461 seems to be a similar
>> issue.
>>
>> On Tue, Feb 11, 2020 at 06:06:54AM +0100, Andre Tomt wrote:
>>> Since upgrading my RDMA lab from kernel 5.4.x to 5.5.x, NFSv4 over RDMA
>>> stopped working. But only on my AMD Ryzen systems. And so far only NFS,
>>> curiously other RDMA diagnostic tools (like qperf <ip> -cm1 rc_bw) work
>>> fine.
>>>
>>> A git bisect points to be62dbf554c5b50718a54a359372c148cd9975c7 iommu/amd:
>>> Convert AMD iommu driver to the dma-iommu api
>>>
>>> 5.5.3-rc1, 5.6-rc1 are also not working.
>>>
>>> I verified it by booting with amd_iommu=off on the kernel cmdline - it makes
>>> everything work again.
>>>
>>> The NFS config is a pretty simple NFSv4.x only, sec=sys setup, running over
>>> RoCEv1 on Mellanox mlx4 hardware (ConnectX-3 Pro, fw 2.42.5000). Nothing
>>> fancy besides the RoCEv1 and related bits network bits like PFC and storage
>>> VLAN. Bare metal, no virtualization.
>>>
>>> The impacted systems are:
>>> ASUS ROG STRIX X399-E GAMING, with a Threadripper 1950x, BIOS 1002
>>> ASUS Pro WS X570-ACE, with a Ryzen 7 3700x, BIOS 1201
>>>
>>> pcaps off a mirror port can be provided. They show that on 5.5.x, CM
>>> succeeds, and then a couple of NFS NULL calls comes through (over RoCE),
>>> both acked, and then the rest just never goes out from the client until the
>>> mount times out and CM is torn down.
>>>
>>> No messages shows up in the kernel log on either side. I was at least
>>> expecting some scary IOMMU warnings.
>>>
>>> More serious hardware is not available for RDMA testing currently, so I dont
>>> know if a EPYC system or newer mlx5 cards would have similar issues. Intel
>>> I've only tested as server so far, that worked fine, as expected given the
>>> bisect result.
>>>
>>>
>>>> git bisect start
>>>> # bad: [d5226fa6dbae0569ee43ecfc08bdcd6770fc4755] Linux 5.5
>>>> git bisect bad d5226fa6dbae0569ee43ecfc08bdcd6770fc4755
>>>> # good: [219d54332a09e8d8741c1e1982f5eae56099de85] Linux 5.4
>>>> git bisect good 219d54332a09e8d8741c1e1982f5eae56099de85
>>>> # good: [8c39f71ee2019e77ee14f88b1321b2348db51820] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
>>>> git bisect good 8c39f71ee2019e77ee14f88b1321b2348db51820
>>>> # bad: [76bb8b05960c3d1668e6bee7624ed886cbd135ba] Merge tag 'kbuild-v5.5' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
>>>> git bisect bad 76bb8b05960c3d1668e6bee7624ed886cbd135ba
>>>> # good: [21b26d2679584c6a60e861aa3e5ca09a6bab0633] Merge tag '5.5-rc-smb3-fixes' of git://git.samba.org/sfrench/cifs-2.6
>>>> git bisect good 21b26d2679584c6a60e861aa3e5ca09a6bab0633
>>>> # good: [e5b3fc125d768eacd73bb4dc5019f0ce95635af4] Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>>>> git bisect good e5b3fc125d768eacd73bb4dc5019f0ce95635af4
>>>> # bad: [937d6eefc716a9071f0e3bada19200de1bb9d048] Merge tag 'docs-5.5a' of git://git.lwn.net/linux
>>>> git bisect bad 937d6eefc716a9071f0e3bada19200de1bb9d048
>>>> # bad: [1daa56bcfd8b329447e0c1b1e91c3925d08489b7] Merge tag 'iommu-updates-v5.5' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
>>>> git bisect bad 1daa56bcfd8b329447e0c1b1e91c3925d08489b7
>>>> # good: [937790699be9c8100e5358625e7dfa8b32bd33f2] mm/page_io.c: annotate refault stalls from swap_readpage
>>>> git bisect good 937790699be9c8100e5358625e7dfa8b32bd33f2
>>>> # good: [a5255bc31673c72e264d837cd13cd3085d72cb58] Merge tag 'dmaengine-5.5-rc1' of git://git.infradead.org/users/vkoul/slave-dma
>>>> git bisect good a5255bc31673c72e264d837cd13cd3085d72cb58
>>>> # good: [34d1b0895dbd10713c73615d8f532e78509e12d9] iommu/arm-smmu: Remove duplicate error message
>>>> git bisect good 34d1b0895dbd10713c73615d8f532e78509e12d9
>>>> # bad: [3c124435e8dd516df4b2fc983f4415386fd6edae] iommu/amd: Support multiple PCI DMA aliases in IRQ Remapping
>>>> git bisect bad 3c124435e8dd516df4b2fc983f4415386fd6edae
>>>> # bad: [be62dbf554c5b50718a54a359372c148cd9975c7] iommu/amd: Convert AMD iommu driver to the dma-iommu api
>>>> git bisect bad be62dbf554c5b50718a54a359372c148cd9975c7
>>>> # good: [781ca2de89bae1b1d2c96df9ef33e9a324415995] iommu: Add gfp parameter to iommu_ops::map
>>>> git bisect good 781ca2de89bae1b1d2c96df9ef33e9a324415995
>>>> # good: [6e2350207f40e24884da262976f7fd4fba387e8a] iommu/dma-iommu: Use the dev->coherent_dma_mask
>>>> git bisect good 6e2350207f40e24884da262976f7fd4fba387e8a
>>>> # first bad commit: [be62dbf554c5b50718a54a359372c148cd9975c7] iommu/amd: Convert AMD iommu driver to the dma-iommu api
> 
> --
> Chuck Lever
> 
> 
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
