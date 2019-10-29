Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB4AE7F6C
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 06:07:25 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1C89ADD5;
	Tue, 29 Oct 2019 05:07:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4B199CCE
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 05:07:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9E58914D
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 05:07:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 22:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,242,1569308400"; d="scan'208";a="224855033"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2019 22:07:12 -0700
Subject: Re: [PATCH v7 09/11] iommu/vt-d: Add bind guest PASID support
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-10-git-send-email-jacob.jun.pan@linux.intel.com>
	<a9a1c3ed-0134-f531-fbf1-789f6cc78ce3@linux.intel.com>
	<20191028152945.13bc22fa@jacob-builder>
	<e4ac7f82-a224-3388-88ae-1ce52d2eec58@linux.intel.com>
	<20191028211121.4ba2f332@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0907d1ef-e36d-4bc5-8715-bc0c50a78a5c@linux.intel.com>
Date: Tue, 29 Oct 2019 13:04:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028211121.4ba2f332@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 10/29/19 12:11 PM, Jacob Pan wrote:
> On Tue, 29 Oct 2019 10:54:48 +0800
> Lu Baolu<baolu.lu@linux.intel.com>  wrote:
> 
>> Hi,
>>
>> On 10/29/19 6:29 AM, Jacob Pan wrote:
>>> Hi Baolu,
>>>
>>> Appreciate the thorough review, comments inline.
>> You are welcome.
>>
>>> On Sat, 26 Oct 2019 10:01:19 +0800
>>> Lu Baolu<baolu.lu@linux.intel.com>  wrote:
>>>    
>>>> Hi,
>>>>   
>> [...]
>>
>>>>> +			 * allow multiple bind calls with the
>>>>> same PASID and pdev.
>>>>> +			 */
>>>>> +			sdev->users++;
>>>>> +			goto out;
>>>>> +		}
>>>> I remember I ever pointed this out before. But I forgot how we
>>>> addressed it. So forgive me if this has been addressed.
>>>>
>>>> What if we have a valid bound svm but @dev doesn't belong to it
>>>> (a.k.a. @dev not in svm->devs list)?
>>>>   
>>> If we are binding a new device to an existing/active PASID, the code
>>> will allocate a new sdev and add that to the svm->devs list.
>> But allocating a new sdev and adding device is in below else branch,
>> so it will never reach there, right?
>>
> No, allocating sdev is outside else branch.

Oh, yes! Please ignore it.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
