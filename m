Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A73D4026
	for <lists.iommu@lfdr.de>; Fri, 23 Jul 2021 20:04:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88D2241486;
	Fri, 23 Jul 2021 18:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HoVxvmNTAoKW; Fri, 23 Jul 2021 18:04:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 54C1541480;
	Fri, 23 Jul 2021 18:04:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27165C0020;
	Fri, 23 Jul 2021 18:04:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B871C000E
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 18:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36A10405CE
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 18:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFG7DgdMMwQC for <iommu@lists.linux-foundation.org>;
 Fri, 23 Jul 2021 18:04:03 +0000 (UTC)
X-Greylist: delayed 00:09:50 by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4059E401FC
 for <iommu@lists.linux-foundation.org>; Fri, 23 Jul 2021 18:04:03 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NHXjsE010920; Fri, 23 Jul 2021 13:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=tAPkpQeFLm7/MzUH5kG/tXZNZdNBdy5KfbESo14Kjvc=;
 b=c6quvI6RJqixGnLflv7xp8GK69x7HbFFN8UrLiLiqJHQ5SHMXp1ksiqgOHqMHuGw1n6u
 5L1LOSPwckA0bcLpa9iUNs1cG3tI3GxwWYjXji+iRLRMvijyTsMCwViab+frGF5qTuzf
 i15JIsg8uCma1WRABxR9/v8DxdmLcjqAeGoTn7NOnNDMej0ZoQUpAD0eFsFSSMXEY2j3
 Frw0gitAS2hTl0Dgjg3Ibi/8Syvn8GZEVceIXoDnrAL7oq6t291xXuQM2O3IGcQBO0vA
 JOw2RY92samWmhE03Ecm7fCbGZy0CIw5d/URJjAt4tjd3pFK+SXd5FvvNIrKShxh0Qtu UQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a0216rvwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 13:54:05 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16NHljdE009736;
 Fri, 23 Jul 2021 17:54:03 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 39upu89xuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 17:54:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16NHpSY931523202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Jul 2021 17:51:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7B294203F;
 Fri, 23 Jul 2021 17:53:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3246942042;
 Fri, 23 Jul 2021 17:53:59 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.25.128])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 23 Jul 2021 17:53:59 +0000 (GMT)
Subject: Re: [PATCH v2 0/4] Fix restricted DMA vs swiotlb_exit()
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20210720133826.9075-1-will@kernel.org>
 <57e37ef9-c055-d6a6-2244-2c7dd243b5c1@de.ibm.com>
 <20210723031252.655d6a83.pasic@linux.ibm.com>
 <b8985c53-a83d-f11f-9fa8-af06d1d4bfd0@de.ibm.com>
 <20210723104701.3f8ac227.pasic@linux.ibm.com>
 <ab29cae0-2c1d-354a-5213-9fe4159570e0@de.ibm.com>
 <YPrLualvV9/lE41j@char.us.oracle.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <b5eec658-7c15-5eb4-bb17-4d598997b521@de.ibm.com>
Date: Fri, 23 Jul 2021 19:53:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YPrLualvV9/lE41j@char.us.oracle.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6vBaF-yRpOy8_h-_mo-P5w6Euu-lMiay
X-Proofpoint-GUID: 6vBaF-yRpOy8_h-_mo-P5w6Euu-lMiay
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-23_09:2021-07-23,
 2021-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107230106
Cc: Nathan Chancellor <nathan@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>, iommu@lists.linux-foundation.org,
 Claire Chang <tientzu@chromium.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>
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



On 23.07.21 16:01, Konrad Rzeszutek Wilk wrote:
> On Fri, Jul 23, 2021 at 10:50:57AM +0200, Christian Borntraeger wrote:
>>
>>
>> On 23.07.21 10:47, Halil Pasic wrote:
>>> On Fri, 23 Jul 2021 08:14:19 +0200
>>> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>>>
>>>> Resending with the correct email of Heiko....
>>>>
>>>> On 23.07.21 03:12, Halil Pasic wrote:
>>>>> On Thu, 22 Jul 2021 21:22:58 +0200
>>>>> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>>>>>> On 20.07.21 15:38, Will Deacon wrote:
>>>>>>> Hi again, folks,
>>>>>>>
>>>>>>> This is version two of the patch series I posted yesterday:
>>>>>>>
>>>>>>>       https://lore.kernel.org/r/20210719123054.6844-1-will@kernel.org
>>>>>>>
>>>>>>> The only changes since v1 are:
>>>>>>>
>>>>>>>       * Squash patches 2 and 3, amending the commit message accordingly
>>>>>>>       * Add Reviewed-by and Tested-by tags from Christoph and Claire (thanks!)
>>>>>>>
>>>>>>> I'd usually leave it a bit longer between postings, but since this fixes
>>>>>>> issues with patches in -next I thought I'd spin a new version immediately.
>>>>>>>
>>>>>>> Cheers,
>>>>>>
>>>>>> FWIW, I just bisected virtio-errors with secure execution mode
>>>>>> qemu-system-s390x: virtio-serial-bus: Unexpected port id 4205794771 for device virtio-serial0.0
>>>>>>
>>>>>> to
>>>>>> commit 903cd0f315fe426c6a64c54ed389de0becb663dc
>>>>>> Author: Claire Chang <tientzu@chromium.org>
>>>>>> Date:   Thu Jun 24 23:55:20 2021 +0800
>>>>>>
>>>>>>          swiotlb: Use is_swiotlb_force_bounce for swiotlb data bouncing
>>>>>>
>>>>>> Unfortunately this patch series does NOT fix this issue, so it seems that even more
>>>>>> things are broken.
>>>>>>
>>>>>> Any idea what else might be broken?
>>>>>
>>>>> I've done some debugging, and I think I know what is going on. Since
>>>>> that commit we need to set force_swiotlb before the swiotlb itself is
>>>>> initialized. So the patch below should fix the problem.
>>>>>
>>>>> --------------------8<-------------------------------------
>>>>>
>>>>> From: Halil Pasic <pasic@linux.ibm.com>
>>>>> Date: Fri, 23 Jul 2021 02:57:06 +0200
>>>>> Subject: [PATCH 1/1] s390/pv: fix the forcing of the swiotlb
>>>>>
>>>>> Since commit 903cd0f315fe ("swiotlb: Use is_swiotlb_force_bounce for
>>>>> swiotlb data bouncing") if code sets swiotlb_force it needs to do so
>>>>> before the swiotlb is initialised. Otherwise
>>>>> io_tlb_default_mem->force_bounce will not get set to true, and devices
>>>>> that use (the default) swiotlb will not bounce  despite switolb_force
>>>>> having the value of SWIOTLB_FORCE.
>>>>>
>>>>> Let us restore swiotlb functionality for PV by fulfilling this new
>>>>> requirement.
>>>> I would add:
>>>> Fixes: 903cd0f315fe ("swiotlb: Use is_swiotlb_force_bounce for swiotlb data bouncing")
>>>> as this patch breaks things
>>>> and
>>>> Fixes: 64e1f0c531d1 ("s390/mm: force swiotlb for protected virtualization")
>>>>
>>>> to make the s390 init code more robust in case people start backporting things.
>>>
>>> I agree. Do we want this backported to the stable releases that have
>>> 64e1f0c531d1  (i.e. do we need a cc stable) or should the fixes tag just
>>> serve as metadata? My guess is, it's the former. In that sense should I
>>> add the tags along with an explanation for the second fixes respin with
>>> cc stable?
>>>
>>> (BTW I don't think this formally qualifies for the stable backports, but
>>> I hope we can make an exception...)
>>
>> I think it makes sense for stable as it is cleaner to set the flags before
>> calling the init function. cc stable would be better and the right way
>> according to process, but the Fixes tag is mostly enough.
> 
> But the reaso for fixing this is for code that is not yet in Linus's
> tree?
> 
> I can just pick this patch up and add it in the pile I have for the next
> merge window?

That would also work for me. I think Halil wanted to send out and v2.
In any case
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>

so that you can take this via the swiotlb tree.

>>
>>>
>>>>
>>>>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>>>>
>>>> I can confirm that this fixes the problem. This also makes sense codewise.
>>>>
>>>> Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>>> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>>
>>> Thanks!
>>>
>>> Regards,
>>> Halil
>>>>
>>>> Konrad, Heiko, Vasily, any preference which tree this goes? I think s390
>>>> would be easiest, but that requires that the patches in the swiotlb tree have
>>>> fixed commit IDs.
>>>>
>>>>> ---
>>>>>     arch/s390/mm/init.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
>>>>> index 8ac710de1ab1..07bbee9b7320 100644
>>>>> --- a/arch/s390/mm/init.c
>>>>> +++ b/arch/s390/mm/init.c
>>>>> @@ -186,9 +186,9 @@ static void pv_init(void)
>>>>>     		return;
>>>>>     	/* make sure bounce buffers are shared */
>>>>> +	swiotlb_force = SWIOTLB_FORCE;
>>>>>     	swiotlb_init(1);
>>>>>     	swiotlb_update_mem_attributes();
>>>>> -	swiotlb_force = SWIOTLB_FORCE;
>>>>>     }
>>>>>     void __init mem_init(void)
>>>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
