Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 73106100FC
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 22:38:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7383F1D99;
	Tue, 30 Apr 2019 20:38:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF0091AA3
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 20:37:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 50930608
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 20:37:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF71A30A3AFE;
	Tue, 30 Apr 2019 20:37:57 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E406299C;
	Tue, 30 Apr 2019 20:37:55 +0000 (UTC)
Subject: Re: [PATCH] iommu/vt-d: Fix intel_pasid_max_id
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20190430072940.10467-1-eric.auger@redhat.com>
	<20190430110108.7c751195@jacob-builder>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <1f71902d-28c6-4e63-b4b8-dafbb8881694@redhat.com>
Date: Tue, 30 Apr 2019 22:37:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190430110108.7c751195@jacob-builder>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 30 Apr 2019 20:37:57 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, dwmw2@infradead.org,
	iommu@lists.linux-foundation.org, eric.auger.pro@gmail.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Jacob,

On 4/30/19 8:01 PM, Jacob Pan wrote:
> On Tue, 30 Apr 2019 09:29:40 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> Extended Capability Register PSS field (PASID Size Supported)
>> corresponds to the PASID bit size -1.
>>
>> "A value of N in this field indicates hardware supports PASID
>> field of N+1 bits (For example, value of 7 in this field,
>> indicates 8-bit PASIDs are supported)".
>>
>> Fix the computation of intel_pasid_max_id accordingly.
>>
>> Fixes: 562831747f62 ("iommu/vt-d: Global PASID name space")
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  drivers/iommu/intel-iommu.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
>> index 28cb713d728c..c3f1bfc81d2e 100644
>> --- a/drivers/iommu/intel-iommu.c
>> +++ b/drivers/iommu/intel-iommu.c
>> @@ -3331,7 +3331,7 @@ static int __init init_dmars(void)
>>  		 * than the smallest supported.
>>  		 */
>>  		if (pasid_supported(iommu)) {
>> -			u32 temp = 2 << ecap_pss(iommu->ecap);
>> +			u32 temp = 2 << (ecap_pss(iommu->ecap) + 1);
> here it is "2 << bits" not "1 << bits", so the original code is correct.
> 
> But I agree it would be more clear to the spec. if we do:
> 1 << (ecap_pss(iommu->ecap) + 1);
Oups OK, my eyes. Forget it :-(

Thanks

Eric
>>  
>>  			intel_pasid_max_id = min_t(u32, temp,
>>  						   intel_pasid_max_id);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
