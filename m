Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CE81BB68
	for <lists.iommu@lfdr.de>; Mon, 13 May 2019 18:58:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7542DF07;
	Mon, 13 May 2019 16:58:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DF1049F0
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 16:58:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 70AC882C
	for <iommu@lists.linux-foundation.org>;
	Mon, 13 May 2019 16:58:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD2CFC050061;
	Mon, 13 May 2019 16:58:53 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C37C616934;
	Mon, 13 May 2019 16:58:48 +0000 (UTC)
Subject: Re: [PATCH 3/4] iommu/vt-d: Handle RMRR with PCI bridge device scopes
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20190513071302.30718-1-eric.auger@redhat.com>
	<20190513071302.30718-4-eric.auger@redhat.com>
	<20190513094100.6fd1276b@jacob-builder>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <750bc8f8-7b32-e1eb-794c-c60f8cec70b2@redhat.com>
Date: Mon, 13 May 2019 18:58:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190513094100.6fd1276b@jacob-builder>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 13 May 2019 16:58:53 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com, robin.murphy@arm.com, will.deacon@arm.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	sudeep.holla@arm.com, dwmw2@infradead.org, eric.auger.pro@gmail.com
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

On 5/13/19 6:41 PM, Jacob Pan wrote:
> On Mon, 13 May 2019 09:13:01 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> When reading the vtd specification and especially the
>> Reserved Memory Region Reporting Structure chapter,
>> it is not obvious a device scope element cannot be a
>> PCI-PCI bridge, in which case all downstream ports are
>> likely to access the reserved memory region. Let's handle
>> this case in device_has_rmrr.
>>
>> Fixes: ea2447f700ca ("intel-iommu: Prevent devices with RMRRs from
>> being placed into SI Domain")
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  drivers/iommu/intel-iommu.c | 32 +++++++++++++++++++++++---------
>>  1 file changed, 23 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
>> index e2134b13c9ae..89d82a1d50b1 100644
>> --- a/drivers/iommu/intel-iommu.c
>> +++ b/drivers/iommu/intel-iommu.c
>> @@ -736,12 +736,31 @@ static int iommu_dummy(struct device *dev)
>>  	return dev->archdata.iommu == DUMMY_DEVICE_DOMAIN_INFO;
>>  }
>>  
>> +static bool
>> +is_downstream_to_pci_bridge(struct device *deva, struct device *devb)
>> +{
>> +	struct pci_dev *pdeva, *pdevb;
>> +
> is there a more illustrative name for these. i guess deva is is the
> bridge dev?
deva is the candidate PCI device likely to belong to the PCI
sub-hierarchy of devb (the candidate bridge).

My concern about the naming was that they are not necessarily a pci
device or a bridge. But at least I can add a comment or rename according
to your suggestion ;-)


>> +	if (!dev_is_pci(deva) || !dev_is_pci(devb))
>> +		return false;
>> +
>> +	pdeva = to_pci_dev(deva);
>> +	pdevb = to_pci_dev(devb);
>> +
>> +	if (pdevb->subordinate &&
>> +	    pdevb->subordinate->number <= pdeva->bus->number &&
>> +	    pdevb->subordinate->busn_res.end >= pdeva->bus->number)
>> +		return true;
>> +
>> +	return false;
>> +>> +
> this seems to be a separate cleanup patch.
I can split into 2 patches: introduction of this helper and its usage in
device_to_iommu and second patch using it in iommu_has_rmrr.

>>  static struct intel_iommu *device_to_iommu(struct device *dev, u8
>> *bus, u8 *devfn) {
>>  	struct dmar_drhd_unit *drhd = NULL;
>>  	struct intel_iommu *iommu;
>>  	struct device *tmp;
>> -	struct pci_dev *ptmp, *pdev = NULL;
>> +	struct pci_dev *pdev = NULL;
>>  	u16 segment = 0;
>>  	int i;
>>  
>> @@ -787,13 +806,7 @@ static struct intel_iommu
>> *device_to_iommu(struct device *dev, u8 *bus, u8 *devf goto out;
>>  			}
>>  
>> -			if (!pdev || !dev_is_pci(tmp))
>> -				continue;
>> -
>> -			ptmp = to_pci_dev(tmp);
>> -			if (ptmp->subordinate &&
>> -			    ptmp->subordinate->number <=
>> pdev->bus->number &&
>> -			    ptmp->subordinate->busn_res.end >=
>> pdev->bus->number)
>> +			if (is_downstream_to_pci_bridge(dev, tmp))
>>  				goto got_pdev;
>>  		}
>>  
>> @@ -2886,7 +2899,8 @@ static bool device_has_rmrr(struct device *dev)
>>  		 */
>>  		for_each_active_dev_scope(rmrr->devices,
>>  					  rmrr->devices_cnt, i, tmp)
>> -			if (tmp == dev) {
>> +			if (tmp == dev ||
>> +			    is_downstream_to_pci_bridge(dev, tmp)) {
>>  				rcu_read_unlock();
>>  				return true;
>>  			}
> 
> [Jacob Pan]
> 
Thanks

Eric
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
