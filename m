Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D55F556A131
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 13:43:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE9D83F70;
	Thu,  7 Jul 2022 11:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEE9D83F70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZGjah3HIc5a; Thu,  7 Jul 2022 11:43:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 924CD83F6F;
	Thu,  7 Jul 2022 11:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 924CD83F6F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60195C007D;
	Thu,  7 Jul 2022 11:43:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD61EC002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 11:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 841D383F6F
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 11:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 841D383F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IAyJ90FXssYY for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 11:43:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2130983F40
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2130983F40
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 11:43:26 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ldvcv1r6zzkWmC;
 Thu,  7 Jul 2022 19:41:19 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Jul 2022 19:43:22 +0800
Subject: Re: [PATCH v9 7/8] docs: trace: Add HiSilicon PTT device driver
 documentation
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20220606115555.41103-1-yangyicong@hisilicon.com>
 <20220606115555.41103-8-yangyicong@hisilicon.com>
 <20220706175751.GA2546265@p14s>
Message-ID: <75afb15e-9fc2-d14a-c72d-dc33589cfc0e@huawei.com>
Date: Thu, 7 Jul 2022 19:43:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220706175751.GA2546265@p14s>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Cc: mark.rutland@arm.com, prime.zeng@huawei.com, linux-doc@vger.kernel.org,
 alexander.shishkin@linux.intel.com, linux-pci@vger.kernel.org,
 linuxarm@huawei.com, james.clark@arm.com, will@kernel.org, corbet@lwn.net,
 peterz@infradead.org, mingo@redhat.com, helgaas@kernel.org,
 liuqi115@huawei.com, suzuki.poulose@arm.com, acme@kernel.org,
 zhangshaokun@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, iommu@lists.linux-foundation.org,
 leo.yan@linaro.org, robin.murphy@arm.com
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
From: Yicong Yang via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yicong Yang <yangyicong@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2022/7/7 1:57, Mathieu Poirier wrote:
> Hi,
> 
> I have started looking at this set.

Thanks!

> 
> On Mon, Jun 06, 2022 at 07:55:54PM +0800, Yicong Yang wrote:
>> Document the introduction and usage of HiSilicon PTT device driver.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> ---
>>  Documentation/trace/hisi-ptt.rst | 307 +++++++++++++++++++++++++++++++
>>  Documentation/trace/index.rst    |   1 +
> 
> The "get_maintainer" script clearly indicates that Jonathan Corbet maintains the
> Documentation directory and yet he is not CC'ed on this patch, nor is the
> linux-doc mainling list.  As such, it would not be possible to merge this
> patchset.
> 

sorry for missing. +cc'ed.

>>  2 files changed, 308 insertions(+)
>>  create mode 100644 Documentation/trace/hisi-ptt.rst
>>
>> diff --git a/Documentation/trace/hisi-ptt.rst b/Documentation/trace/hisi-ptt.rst
>> new file mode 100644
>> index 000000000000..0a3112244d40
>> --- /dev/null
>> +++ b/Documentation/trace/hisi-ptt.rst
>> @@ -0,0 +1,307 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +======================================
>> +HiSilicon PCIe Tune and Trace device
>> +======================================
>> +
>> +Introduction
>> +============
>> +
>> +HiSilicon PCIe tune and trace device (PTT) is a PCIe Root Complex
>> +integrated Endpoint (RCiEP) device, providing the capability
>> +to dynamically monitor and tune the PCIe link's events (tune),
>> +and trace the TLP headers (trace). The two functions are independent,
>> +but is recommended to use them together to analyze and enhance the
>> +PCIe link's performance.
>> +
>> +On Kunpeng 930 SoC, the PCIe Root Complex is composed of several
>> +PCIe cores. Each PCIe core includes several Root Ports and a PTT
>> +RCiEP, like below. The PTT device is capable of tuning and
>> +tracing the links of the PCIe core.
>> +::
>> +
>> +          +--------------Core 0-------+
>> +          |       |       [   PTT   ] |
>> +          |       |       [Root Port]---[Endpoint]
>> +          |       |       [Root Port]---[Endpoint]
>> +          |       |       [Root Port]---[Endpoint]
>> +    Root Complex  |------Core 1-------+
>> +          |       |       [   PTT   ] |
>> +          |       |       [Root Port]---[ Switch ]---[Endpoint]
>> +          |       |       [Root Port]---[Endpoint] `-[Endpoint]
>> +          |       |       [Root Port]---[Endpoint]
>> +          +---------------------------+
>> +
>> +The PTT device driver registers one PMU device for each PTT device.
>> +The name of each PTT device is composed of 'hisi_ptt' prefix with
>> +the id of the SICL and the Core where it locates. The Kunpeng 930
>> +SoC encapsulates multiple CPU dies (SCCL, Super CPU Cluster) and
>> +IO dies (SICL, Super I/O Cluster), where there's one PCIe Root
>> +Complex for each SICL.
>> +::
>> +
>> +    /sys/devices/hisi_ptt<sicl_id>_<core_id>
> 
> All entries added to sysfs should have corresponding documentation.  See [1] and
> [2] for details and [3] for an example.
> 
> [1]. https://elixir.bootlin.com/linux/latest/source/Documentation/ABI/README
> [2]. https://elixir.bootlin.com/linux/latest/source/Documentation/ABI/testing
> [3]. https://elixir.bootlin.com/linux/latest/source/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> 

ok. I'll add a patch for ABI description. Thanks for the reference.

>> +
>> +Tune
>> +====
>> +
>> +PTT tune is designed for monitoring and adjusting PCIe link parameters (events).
>> +Currently we support events in 4 classes. The scope of the events
>> +covers the PCIe core to which the PTT device belongs.
>> +
>> +Each event is presented as a file under $(PTT PMU dir)/tune, and
>> +a simple open/read/write/close cycle will be used to tune the event.
>> +::
>> +
>> +    $ cd /sys/devices/hisi_ptt<sicl_id>_<core_id>/tune
>> +    $ ls
>> +    qos_tx_cpl    qos_tx_np    qos_tx_p
>> +    tx_path_rx_req_alloc_buf_level
>> +    tx_path_tx_req_alloc_buf_level
> 
> These look overly long... How about watermark_rx and watermark_tx?
> 

These are gotten from the hardware manual and abbreviated. These events are highly connected
to the hardware desgin so I think it's better to keep consistence. The watermark_{rx, tx} will
become ambigious when we add more events for Rx path or other Tx path events.

The event code is composed of two parts. First part (tx_path) describes which path it belongs to
and second part describes the function ({rx,tx}_req_alloc_buf_level). We called the link path
between CPU and PCIe RC as Rx path and the path between PCIe RC to the PCIe link as Tx path.
So we need to have tx_path prefix for the Tx path and {rx, tx}_req_alloc_buf_level for the
requested watermark of {inbound, outbound} buffer allocation. Indeed we have other Tx path
buffer events which are not exported in this series.


>> +    $ cat qos_tx_dp
>> +    1
>> +    $ echo 2 > qos_tx_dp
>> +    $ cat qos_tx_dp
>> +    2
>> +
>> +Current value (numerical value) of the event can be simply read
>> +from the file, and the desired value written to the file to tune.
>> +
>> +1. Tx path QoS control
>> +------------------------
>> +
>> +The following files are provided to tune the QoS of the tx path of
>> +the PCIe core.
>> +
>> +- qos_tx_cpl: weight of Tx completion TLPs
>> +- qos_tx_np: weight of Tx non-posted TLPs
>> +- qos_tx_p: weight of Tx posted TLPs
>> +
>> +The weight influences the proportion of certain packets on the PCIe link.
>> +For example, for the storage scenario, increase the proportion
>> +of the completion packets on the link to enhance the performance as
>> +more completions are consumed.
>> +
>> +The available tune data of these events is [0, 1, 2].
>> +Writing a negative value will return an error, and out of range
>> +values will be converted to 2. Note that the event value just
>> +indicates a probable level, but is not precise.
>> +
>> +2. Tx path buffer control
>> +-------------------------
>> +
>> +Following files are provided to tune the buffer of tx path of the PCIe core.
>> +
>> +- tx_path_rx_req_alloc_buf_level: watermark of Rx requested
>> +- tx_path_tx_req_alloc_buf_level: watermark of Tx requested
>> +
>> +These events influence the watermark of the buffer allocated for each
>> +type. Rx means the inbound while Tx means outbound. The packets will
>> +be stored in the buffer first and then transmitted either when the
>> +watermark reached or when timed out. For a busy direction, you should
>> +increase the related buffer watermark to avoid frequently posting and
>> +thus enhance the performance. In most cases just keep the default value.
>> +
>> +The available tune data of above events is [0, 1, 2].
>> +Writing a negative value will return an error, and out of range
>> +values will be converted to 2. Note that the event value just
>> +indicates a probable level, but is not precise.
> 
> This is useful documentation but it also should be found in the ABI
> documentation referred to above.
> 
>> +
>> +Trace
>> +=====
>> +
>> +PTT trace is designed for dumping the TLP headers to the memory, which
>> +can be used to analyze the transactions and usage condition of the PCIe
>> +Link. You can choose to filter the traced headers by either requester ID,
>> +or those downstream of a set of Root Ports on the same core of the PTT
>> +device. It's also supported to trace the headers of certain type and of
>> +certain direction.
>> +
>> +You can use the perf command `perf record` to set the parameters, start
>> +trace and get the data. It's also supported to decode the trace
>> +data with `perf report`. The control parameters for trace is inputted
>> +as event code for each events, which will be further illustrated later.
>> +An example usage is like
>> +::
>> +
>> +    $ perf record -e hisi_ptt0_2/filter=0x80001,type=1,direction=1,
>> +      format=1/ -- sleep 5
>> +
>> +This will trace the TLP headers downstream root port 0000:00:10.1 (event
>> +code for event 'filter' is 0x80001) with type of posted TLP requests,
>> +direction of inbound and traced data format of 8DW.
>> +
>> +1. filter
>> +---------
>> +
>> +The TLP headers to trace can be filtered by the Root Ports or the requester
>> +ID of the endpoints, which are located on the same core of the PTT device.
>> +You can set the filter by specifying the `filter` parameter which is required
>> +to start the trace. The parameter value is 20 bit. The supported filters and
>> +related values are outputted through `available_root_port_filters` and
>> +`available_requester_filters` sysfs attributes for Root Ports and Requesters
>> +respectively.
>> +::
>> +
>> +    $ cat available_root_port_filters
>> +    0000:00:10.0	0x80001
>> +    0000:00:11.0	0x80004
>> +    $ cat available_requester_filters
>> +    0000:01:00.0	0x00100
>> +    0000:01:00.1	0x00101
> 
> If I remember correctly, one of the rule for sysfs is one line per entry.
> 

Since one PTT devices may support several Root Ports and Endpoints on its core, I find no better
way to make this information convenient and easy to use for the users to collect. So maybe this
canbe an exception and there seems to have some limited examples like
/sys/devices/system/node/node<N>/{meminfo, vmstat, meminfo}.

>> +
>> +Note that multiple Root Ports can be specified at one time, but only
>> +one Endpoint function can be specified in one trace. Specifying both
>> +Root Port and function at the same time is not supported.
>> +
>> +If no filter is available, reading the related filter sysfs attribute
>> +will get an empty string.
>> +::
>> +
>> +    $ cat available_root_port_filters
>> +
>> +    $ cat available_requester_filters
> 
> Those too look overly long, and where to find them is not documented.  As such
> users have to guest that it must be somewhere under
> /sys/devices/hisi_ptt<sicl_id>_<core_id>/.
> 

Since Root Port and Requester are PCIe terminologies so it's better to have them
embedded to make it clear. Maybe 'available' can be removed.

Will have all these sysfs attributes documented.

> More comments tomorrow.
> 

Thanks,
Yicong
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
