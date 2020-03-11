Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C6C181CC9
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 16:48:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A339986234;
	Wed, 11 Mar 2020 15:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rW1+xfvsz0Zi; Wed, 11 Mar 2020 15:48:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 15C2C85C92;
	Wed, 11 Mar 2020 15:48:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B5BEC0177;
	Wed, 11 Mar 2020 15:48:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC804C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 15:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DB51B87F81
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 15:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0BDD01tPVJR for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:48:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9DB2387998
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1583941703;
 bh=1Tw0NQa8rIXSRaGMipNTf6ChcnDieyjhjdU91ilJ/9c=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=MiYa6t2Gug3G757sk4PVF9mP0XXaG1PGV8rkVZTJylVwA0E8t8gOD20gRV39hKfid
 RQkL/ZywdTBWLynGOV+Pj87O1el3nzOAkdVNro4Y93nUmWHUtPM63r7au1kEYPCJHc
 8eFCyhN1+nkSXTdWdw4K3PQvBCBtdRQ+AaJhU0w0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.81.10.6] ([196.52.84.30]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MHXFr-1j7R2M1Y6z-00DYi8; Wed, 11
 Mar 2020 16:48:23 +0100
Subject: Re: [Bug 206175] Fedora >= 5.4 kernels instantly freeze on boot
 without producing any display output
To: Christoph Hellwig <hch@lst.de>
References: <bug-206175-5873@https.bugzilla.kernel.org/>
 <bug-206175-5873-S6PaNNClEr@https.bugzilla.kernel.org/>
 <CAHk-=wi4GS05j67V0D_cRXRQ=_Jh-NT0OuNpF-JFsDFj7jZK9A@mail.gmail.com>
 <20200310162342.GA4483@lst.de>
 <CAHk-=wgB2YMM6kw8W0wq=7efxsRERL14OHMOLU=Nd1OaR+sXvw@mail.gmail.com>
 <20200310182546.GA9268@lst.de> <20200311152453.GB23704@lst.de>
 <e70dd793-e8b8-ab0c-6027-6c22b5a99bfc@gmx.com>
 <20200311154328.GA24044@lst.de>
From: "Artem S. Tashkinov" <aros@gmx.com>
Message-ID: <19498990-fb97-b739-cd19-6a6415ba88a2@gmx.com>
Date: Wed, 11 Mar 2020 15:48:21 +0000
MIME-Version: 1.0
In-Reply-To: <20200311154328.GA24044@lst.de>
Content-Language: ru
X-Provags-ID: V03:K1:msGzND2fOhFL2TKorpWUGPUo5Wzj/e8zqHtZz35HauooJbeO2bC
 qumRq9aLV4VZ/H3Fov8WBHNnNXyTx+AoNF+okw//oD1J6veuLVuuuWqF+GaE+G9tXZJf7hw
 zgQWWOUoMYA5OVx4yqqOAvglnFtCWmDLEPNB9zXEfiLFZCHxNZURlXlDy+4kTjVxQRM2Z1l
 wOdIkudEMjJgcFNd7b3yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XpiSIOCzW9c=:pDPFFAL9JiN/b0yZtJ0ee7
 Jy9oJ2D0XY5E0mVtCedKsZ+G3jYTpByHW2gkcdn0z1213xVzXCWrV7CvILaM5bfC3TxJMhDOy
 hwmGHbT5X4ztfVJvcI8L7ZmwZYLJpvSx6maV18R2qWC5TqzAmdRPuanu67rrVwDotPPN5+rnn
 6UewcOLLkRxzupJ2ON+9elYZc8IHkEq3f+PLOnk7ieFMmMuX8m8yAns/mBcJ/k/GDo5xRCSS+
 /poto7BtxtFXj6BmoZCa5CQY1BV8/PaAAUb62oDdBrmXh9buNGRggqKCKNAn3B4ThCpclLdTf
 WA2L7OzMsI7IttuFBkzAG/iyBhJiSxckrWa3ETmf+ZMyV+xInqEcXmwJ618jK+UjBB6UoCcY9
 ReEgEUHONlNWIh2HF9Zp7+kwXFPds4nWBujmGLkw51vklOrfTgwLKHEMb36AvJO3V/fWgh9rx
 roW+LZ4+8v0b0c2yq4l1oLAqjSk2ymii42/fGAVoOCqTWjVERJGdUFhFaEWEfLHgvWCHcp4ug
 8dZ+crQ4z6ueBXkO3EB0zEVqHVGTrVIUQGv5LuMvNcG1eb9c3/ldmg9o3QadHZxD5MFk19ssi
 AuwlK7Tmj1mreGXn1+9l7qo4YBXJlhrI6qSedFa+M4ZiL3OwPL/QbYl4Xg28vW7oFKCSvDFt2
 MHmdIngC1ILm4FRjUT0spTPurPe+yeYlcyfTgHhjfnIlsrkQ2Z9XiE1Rh1lbRdJDnAxLBJRrd
 cERgWE4sQG+K4yEusOnF4SN2zlUKYMlWvaVjf4Ljz0d+8/AkAizNFSpot+BpQVrF6G4bUAVol
 RZJemUAPmkjK0D2IG3hW9x28ftjPDVVxG7zx2q3gFyxMhE4KLRY23lQIfV9H+KfiAgjLj+K3G
 EZfNyTmlNLw2uRi8q17YQPKmTIvW99KtewD+WaIDaqhEAaR3Bsg8F2Wg1ifnleY9HclPYcs2w
 6SObgMduHW5H3x9aAPmNXVoIWepqDWJ5Mc4d4CuNcdNC8nqYyTubH3XTqeMqRWMGNVAgT87Qe
 SxvN45DTG2t8nv1DuVxd3dulHIepE7qLZy5QnR7CxsXdjeMreBvZZMqpQxiQijRVzU10Sbtq7
 pwiO1n7GZSG32aJOxYTWJGM4GKe8SFBQq5hkQ/9ery+9LKWmLTc/ueLGqNAuQfd/mqw9xvh0q
 WG/ifhtjxPyUfgcvxwWJim592t5uaz0lJLKtyRzzlVmSZijiLnly3nGFP+ohZEyhcEJ5FdJxD
 +45CgQ6pZ9y42wfgj
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
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



On 3/11/20 3:43 PM, Christoph Hellwig wrote:
> On Wed, Mar 11, 2020 at 03:34:38PM +0000, Artem S. Tashkinov wrote:
>> On 3/11/20 3:24 PM, Christoph Hellwig wrote:
>>> pdev->dma_mask = parent->dma_mask ? *parent->dma_mask : 0;
>>
>> This patch makes no difference.
>>
>> The kernel panics with the same call trace which starts with:
>
> This looks really strange and not dma mask related, but there must be
> some odd interactions somewhere.
>
> Can you call gdb on the vmlinux file for the 5.5.8-200.fc31 kernel
> in the jpg and then do
>
> l *(kmem_cache_alloc_trace+0x7e)
>
> l *(acpi_processor_add+0x3a)
>
> and send the output?
>

I'm not sure I can call or do anything because the system is dead and
I'm looking at the kernel panic message. The console is dead. The root
file system is not yet mounted. Initrd can't be loaded either. I have no
COM port/console. I have no debugging abilities whatsoever. I can only
compile kernels and try running them.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
